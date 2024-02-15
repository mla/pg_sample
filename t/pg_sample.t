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

$ENV{PATH} = ".:..:$ENV{PATH}";
$ENV{VERBOSITY} = 'terse';

use strict;
use warnings;
use Carp;
use DBI;
use Getopt::Long qw/ GetOptions :config no_ignore_case /;
use Test::More tests => 27;

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

$dbh->do(qq{
  CREATE TABLE parent (
    parent_id integer PRIMARY KEY
    ,name text NOT NULL UNIQUE
    ,favorite_child_id integer
  )
});

# now create 10 child tables, each with 100 rows pointing to parent
foreach (1..10) {
  $dbh->do(qq{
    CREATE TABLE child$_ (
      child_id integer PRIMARY KEY
      ,name text NOT NULL UNIQUE
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


### Long identifier

  # We construct a temporary table name based on the combination
  # of the schema and table. That was exceeding the maximum identifier
  # length in some cases. We're now truncating the temporary table
  # names when necessary.

  my $maxlen = 63;
  $maxlen = eval {
    $dbh->selectrow_array(
      "SELECT current_setting('max_identifier_length')"
    );
  } // $maxlen;
  if ($@) {
    diag("Unable to determine max identifer length: $@");
    diag("Defaulting to max identifier length of '$maxlen'");
  } else {
    diag("Max identifier length: $maxlen") if $opt{verbose};
  }

  my $long_schema = 'long_schema_' . ('X' x $maxlen);
  $long_schema = substr $long_schema, 0, $maxlen;
  $dbh->do("CREATE SCHEMA $long_schema");

  my $long_name = 'long_name_' . ('X' x $maxlen);
  $long_name = substr $long_name, 0, $maxlen - 1;
  $long_name .= '1';

  $dbh->do(qq{
    CREATE TABLE $long_schema.$long_name (
      id int PRIMARY KEY
    );
  });
  for (1..10) {
    $dbh->do("INSERT INTO $long_schema.$long_name (id) VALUES ($_)");
  }

  $dbh->do(qq{
    CREATE TABLE $long_schema.child (
      id int PRIMARY KEY
      ,parent_id int NOT NULL REFERENCES $long_schema.$long_name
    );
  });
  for (1..10) {
    $dbh->do("INSERT INTO $long_schema.child (id, parent_id) VALUES ($_, $_)");
  }


### End long identifier



### Partitioning

eval {
  $dbh->do(qq{
    CREATE TABLE partition_parent (
      id int PRIMARY KEY
    ) PARTITION BY RANGE(id)
  });
};
if ($@) {
  diag "Skipping declarative partition tests";
} else {
  $dbh->do(qq{
    CREATE TABLE partition_child PARTITION OF partition_parent
      FOR VALUES FROM (0) TO (100)
  });
  
  $dbh->do(qq{
    INSERT INTO partition_parent VALUES (10)
  });
}

### End Parititions

# Create unordered table to test --ordered
$dbh->do(qq{CREATE TABLE "test_ordered" (id SERIAL PRIMARY KEY, name TEXT);});
$dbh->do(qq{CREATE INDEX "my_index" ON "test_ordered" (name);});
$dbh->do(qq{INSERT INTO "test_ordered" VALUES (1, 'b'), (2, 'a');});
$dbh->do(qq{CLUSTER "test_ordered" USING "my_index";  -- with this, default SELECT will return 2,1;});

### Generated Columns
# We have 3 columns here to catch problems with failing to order by our ordinal position.
$dbh->do(qq{
  CREATE TABLE some_numbers(
    number_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY
    , base_val int
    , double_val int GENERATED ALWAYS AS (base_val*2) STORED
    , other_val text
  );
});

$dbh->do(qq{
  INSERT INTO some_numbers(base_val, other_val) (
    SELECT
      generate_series AS base_val,
      RPAD('a', generate_series, 'x') AS other_val
    FROM generate_series(1, 10)
  );
});

$dbh->do(qq{
  CREATE TABLE some_number_ref(
    ref_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY
    , number_id int REFERENCES some_numbers(number_id)
    , note text
  );
});

$dbh->do(qq{
  INSERT INTO some_number_ref(number_id, note) (
    SELECT number_id, RPAD('b',base_val,'y') FROM some_numbers
  )
});

### End Generated Columns

# Perform code coverage analysis? Requires Devel::Cover module.
if ($opt{cover}) {
  $ENV{PERL5OPT} .= ' -MDevel::Cover=+select,pg_sample,+ignore,.*';
}

my @base_opts = ();
push @base_opts, '--db_pass='.$opt{db_pass} if $opt{db_pass};
push @base_opts, '--verbose' if $opt{verbose};
my @opts = (@base_opts, '--limit=100');

my $cmd = "pg_sample @opts $opt{db_name} > sample.sql";
system($cmd) == 0 or die "pg_sample failed: $?";

$dbh->disconnect;
$template1_dbh->do("DROP DATABASE $opt{db_name}");
$template1_dbh->do("CREATE DATABASE $opt{db_name}");
$dbh = connect_db();

# Load the sample DB
$cmd = "psql -q -X -v ON_ERROR_STOP=1 $opt{db_name} < sample.sql";
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

# without --ordered, test_ordered returns as per clustered order
my($ord) = $dbh->selectrow_array(qq{ SELECT STRING_AGG(id::text, ',') FROM "test_ordered" });
is($ord, '2,1', "ordered test case broken, this should return by clustered order");

($cnt) = $dbh->selectrow_array("SELECT count(*) FROM $long_schema.$long_name");
is($cnt, 10, "long table name should have 10 rows");

# Check the generated table loaded properly
my @generated_rows = $dbh->selectall_array(
  qq{ SELECT base_val, double_val FROM some_numbers; },
  { Slice => {} }
);
is(scalar @generated_rows, 10, "some_numbers table should have 10 rows");
foreach my $row (@generated_rows) {
  is($row->{double_val}, $row->{base_val}*2, "The double_val column is not 2x the base_val");
}
# Check generated table fk referential integrity
my @reference_rows = $dbh->selectall_array(
  qq{ SELECT * FROM some_number_ref; },
  { Slice => {} }
);
is(scalar @reference_rows, 10, "The some_number_ref table should have 10 rows");

@opts = (@base_opts, '--ordered');
$cmd = "pg_sample @opts $opt{db_name} > sample_ordered.sql";
system($cmd) == 0 or die "pg_sample failed: $?";

$dbh->disconnect;
$template1_dbh->do("DROP DATABASE $opt{db_name}");
$template1_dbh->do("CREATE DATABASE $opt{db_name}");
$dbh = connect_db();

# Load the sample DB
$cmd = "psql -q -X -v ON_ERROR_STOP=1 $opt{db_name} < sample_ordered.sql";
system($cmd) == 0 or die "pg_sample failed: $?";

$ord = $dbh->selectrow_array(qq{ SELECT STRING_AGG(id::text, ',') FROM "test_ordered" });
is($ord, '1,2', "results should be ordered");

$dbh->disconnect;
$template1_dbh->do("DROP DATABASE $opt{db_name}");

exit 0;
