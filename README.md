NAME
    pg_sample - extract a small, sample dataset from a larger PostgreSQL
    database while maintaining referential integrity.

SYNOPSIS
    pg_sample [ option... ] [ dbname ]

DESCRIPTION
    pg_sample is a utility for exporting a small, sample dataset from a
    larger PostgreSQL database. The output and command-line options closely
    resemble the pg_dump backup utility (although only the plain-text format
    is supported).

    The sample database produced includes all tables from the original,
    maintains referential integrity, and supports circular dependencies.

    To build an actual instance of the sample database, the output of this
    script can be piped to the psql utility. For example, assuming we have
    an existing PostgreSQL database named "mydb", a sample database could be
    constructed with:

      createdb sampledb
      pg_sample mydb | psql sampledb

  Requirements
    * PostgreSQL 8.1 or later

    * pg_dump should be in your search path (in order to dump the schema)

    * Perl DBI and DBD::Pg modules

  Command-line Options
    *dbname*
        Specifies the database to sample. If not specified, uses the
        environment variable PGDATABASE, if defined; otherwise, uses the
        username of the user executing the script.

    -a
    --data-only
        Output only the data, not the schema (data definitions).

    --help
        Output detailed options and exit.

    -E *encoding*
    --encoding=*encoding*
        Use the specified character set encoding. If not specified, uses the
        environment variable PGCLIENTENCODING, if defined; otherwise, uses
        the encoding of the database.

    -f *file*
    --file=*file*
        Send output to the specified file. If omitted, standard output is
        used.

    --force
        Drop the sample schema if it exists.

    --keep
        Don't delete the sample schema when the script finishes.

    --limit=*limit*
        As a numeric value, specifies the default number of rows to copy
        from each table (defaults to 100). Note that sample tables may end
        up with significantly more rows in order to satisfy foreign key
        constraints.

        If the value is a string, it is interpreted as a pattern/rule pair
        to apply to matching tables. Examples:

          # include all rows from the users table
          --limit="users = *"
 
          # include 1,000 rows from users table
          --limit="users = 1000"

          # include all users where deactivated column is false
          --limit="users = NOT deactivated"

          # include all rows from all tables in the forums schema
          --limit="forums.* = *"

        The limit option may be specified multiple times. Multiple
        pattern/rule pairs can also be specified as a single comma-separated
        value. For example:

          # include all rows from the ads table; otherwise default to 300 rows
          --limit="ads=*,*=300"

        Rules are applied in order with the first match taking precedence.

    --random
        Randomize the rows initially selected from each table. May
        significantly increase the running time of the script.

    --schema=*name*
        The schema name to use for the sample database (defaults to
        _pg_sample).

    --trace
        Turn on Perl DBI tracing. See the DBI module documentation for
        details.

    --verbose
        Output status information to standard error.

    The following options control the database connection parameters.

    -h *host*
    --host=*host*
        The host name to connect to. Defaults to the PGHOST environment
        variable if not specified.

    -p *port*
    --port=*port*
        The database port to connect to. Defaults to the PGPORT environment
        variable, if set; otherwise, the default port is used.

    -U *username*
    --username=*username*
        User name to connect as.

    -W *password*
    -password=*password*
        Password to connect with.

LICENSE
    This code is released under the Artistic License. See perlartistic.

SEE ALSO
    createdb(1), pg_dump(1), psql(1)

AUTHOR
    Maurice Aubrey <maurice.aubrey@gmail.com>

[![Build Status](https://travis-ci.org/mla/pg_sample.png)]
(https://travis-ci.org/mla/pg_sample)
