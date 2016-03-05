#!/usr/bin/env perl

# NOTE: THIS SCRIPT IS DESTRUCTIVE! It will drop and recreate the table
#
# Uses TAP testing protocol. See "perldoc prove".
#
# To run this test program with prove, you should be able to just run 'prove'
# or 'prove -v' from the top-level directory.
#
# Or, to supply options (such as database connection info), you can also
# run it directly:
#
#   t/pg_sample.t --db_user=foo
#
# The --cover option will generate code coverage statistics (see Devel::Cover)
# 
#   t/pg_sample.t --cover

our $DB_NAME = '_pg_sample_test';

$ENV{PATH} = "$ENV{PATH}:.:..";
$ENV{VERBOSITY} = 'terse';

use strict;
use warnings;
use Carp;
use DBI;
use Getopt::Long qw/ GetOptions :config no_ignore_case /;
use Test::More tests => 12;

$| = 1;

my %opt;

sub connect_db {
  my $dsn = join ';',
    "dbi:Pg:dbname=$opt{db_name}",
    $opt{db_host} ? "host=$opt{db_host}" : (),
    $opt{db_port} ? "port=$opt{db_port}" : (),
  ;

  my $dbh = DBI->connect(
    $dsn,
    $opt{db_user},
    $opt{db_pass},
    {
      RaiseError       => 1,
      AutoCommit       => 1,
      FetchHashKeyName => 'NAME_lc',
      PrintError       => 0,
      HandleError      => sub { confess( shift ) },
    },
  ) or croak "db connection failed!";

  return $dbh;
}

sub connect_template1 {
  local $opt{db_name} = 'template1';
  return connect_db();
}

%opt = (
  db_name => $DB_NAME,
  db_host => '',
  db_port => '',
);

GetOptions(\%opt,
  'db_name|db-name=s',
  'db_user|db_username|db-user|db-username|username|U=s',
  'db_pass|db_password|db-pass|db-password|password|W=s',
  'db_host|db-host|host=s',
  'db_port|db-port|port=i',
  'force',
  'verbose',
  'cover|coverage|testcover',
);

$opt{db_user} ||= $ENV{PGUSER} || scalar getpwuid($<);
$opt{db_name} ||= shift() || $ENV{PGDATABASE} || $opt{db_user};
$opt{db_host} ||= $ENV{PGHOST} if defined $ENV{PGHOST};
$opt{db_port} ||= $ENV{PGPORT} if defined $ENV{PGPORT};

$ENV{PGUSER} = $opt{db_user};
$ENV{PGDATABASE} = $opt{db_name};
$ENV{PGHOST} = $opt{db_host};
$ENV{PGPORT} = $opt{db_port};

my $template1_dbh = connect_template1();

unless ($opt{force}) {
  my ($db_exists) = $template1_dbh->selectrow_array(qq{
    SELECT TRUE
      FROM pg_database 
     WHERE datname = ?
  }, undef, $opt{db_name});

  if ($db_exists) {
    print STDERR "Warning: database $opt{db_name} will be dropped.\n";
    my $ans = '';
    do {
      print STDERR "Are you sure you want to continue? [Y/n]: ";
      my $i = lc <STDIN>;
      chomp $i;
      $i =~ s/\s+//g;
      $ans = substr($i, 0, 1);
      $ans = 'y' unless defined $ans and length $ans;
    } until ($ans =~ /^[yn]$/);
    if ($ans eq 'n') { exit 0 }
  }
}

eval { $template1_dbh->do("DROP DATABASE $opt{db_name}") };
$template1_dbh->do("CREATE DATABASE $opt{db_name}");

my $dbh = connect_db();
$dbh->do(qq{ SET client_min_messages = warning });

# Does server support JSON data type?
# There was a problem with DISTINCT on tables with JSON columns due
# to lack of equality operator.
# See https://github.com/mla/pg_sample/issues/5
eval {
  $dbh->do("CREATE TEMP TABLE temp_json_test (foo json)");
};
my $has_json = $@ ? 0 : 1;
diag $has_json ? 'JSON support detected' : 'JSON support not detected';

$dbh->do(qq{
  CREATE TABLE parent (
    parent_id          integer PRIMARY KEY
    ,name              text    NOT NULL UNIQUE
    ,favorite_child_id integer
    ,data              @{[ $has_json ? 'json' : 'text' ]}
  )
});

# now create 10 child tables, each with 100 rows pointing to parent
foreach (1..10) {
  $dbh->do(qq{
    CREATE TABLE child$_ (
      child_id   integer PRIMARY KEY
      ,name      text    NOT NULL UNIQUE
      ,parent_id integer REFERENCES parent ON UPDATE CASCADE
    )
  });
}

$dbh->do(qq{
  ALTER TABLE parent ADD FOREIGN KEY (favorite_child_id) REFERENCES child1
});

# create parent 
for (1..1000) {
  $dbh->do(
    qq{ INSERT INTO parent (parent_id, name) VALUES (?, ?) },
    undef,
    $_, "p$_"
  );
}

my $parent_id = 1;
for (1..10) {
  for my $row (1..100) {
    $dbh->do(
      qq{ INSERT INTO child$_ (child_id, name, parent_id) VALUES (?, ?, ?) },
      undef,
      $row, "c$row", $parent_id++,
    );
  }
}

# create circular reference between tables
$dbh->do(qq{
  UPDATE parent
     SET favorite_child_id = (SELECT max(child_id) FROM child1)
   WHERE parent_id = (SELECT min(parent_id) FROM parent)
});

# make sure COPY escaping works
$dbh->do(qq{
  UPDATE parent
     SET name = E'\\\\.'
   WHERE parent_id = 1
});

# create schema/table/column with key words and embedded quotes
# to test quoting logic
$dbh->do(qq{ CREATE SCHEMA "S'""chema" });
$dbh->do(qq{
  CREATE TABLE "S'""chema"."table" (
    "table" text PRIMARY KEY
  )
});
$dbh->do(qq{
  CREATE TABLE "S'""chema".table_details (
    table_detail_id serial PRIMARY KEY
    ,"table" text NOT NULL REFERENCES "S'""chema"."table"
       ON UPDATE CASCADE ON DELETE CASCADE
  )
});

# Perform code coverage analysis? Requires Devel::Cover module.
if ($opt{cover}) {
  $ENV{PERL5OPT} .= ' -MDevel::Cover=+select,pg_sample,+ignore,.*';
}

my @opts = ('--limit=100');
push @opts, '--verbose' if $opt{verbose};
my $cmd = "pg_sample @opts $opt{db_name} > t/sample.sql";
system($cmd) == 0 or die "pg_sample failed: $?";

$dbh->disconnect;
$template1_dbh->do("DROP DATABASE $opt{db_name}");
$template1_dbh->do("CREATE DATABASE $opt{db_name}");
$dbh = connect_db();

$cmd = "psql -q $opt{db_name} < t/sample.sql";
system($cmd) == 0 or die "pg_sample failed: $?";

foreach (1..10) {
  my($cnt) = $dbh->selectrow_array(qq{ SELECT count(*) FROM child$_ });
  is($cnt, 100, "child$_ should have 100 rows");
}

my($cnt) = $dbh->selectrow_array(qq{ SELECT count(*) FROM parent });
is($cnt, 1000, "all parent rows should be fetched due to FKs");

my $row = $dbh->selectrow_hashref(qq{
  SELECT * FROM parent WHERE parent_id = 1
});
is($row->{name}, "\\.", "escaping");

$dbh->disconnect;
$template1_dbh->do("DROP DATABASE $opt{db_name}");

exit 0;
