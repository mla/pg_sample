# NAME

pg\_sample - extract a small, sample dataset from a larger PostgreSQL
database while maintaining referential integrity.

# SYNOPSIS

pg\_sample \[ option... \] \[ dbname \]

# DESCRIPTION

pg\_sample is a utility for exporting a small, sample dataset from a
larger PostgreSQL database. The output and command-line options closely
resemble the pg\_dump backup utility (although only the plain-text format
is supported).

The sample database produced includes all tables from the original,
maintains referential integrity, and supports circular dependencies.

To build an actual instance of the sample database, the output of this script
can be piped to the psql utility. For example, assuming we have an existing
PostgreSQL database named "mydb", a sample database could be constructed with:

    createdb sampledb
    pg_sample mydb | psql sampledb

## Requirements

- PostgreSQL 8.1 or later
- pg\_dump should be in your search path (in order to dump the schema)
- Perl DBI and DBD::Pg (>= 2.0) modules

## Command-line Options

_dbname_

    Specifies the database to sample. If not specified, uses the
    environment variable PGDATABASE, if defined; otherwise, uses
    the username of the user executing the script.

__\-a__  
__\--data-only__

    Output only the data, not the schema (data definitions).

__\--help__

    Output detailed options and exit.

__\-E__ _encoding_  
__\--encoding=__*encoding*

    Use the specified character set encoding. If not specified, uses the
    environment variable PGCLIENTENCODING, if defined; otherwise, uses
    the encoding of the database.

__\-f__ _file_  
__\--file=__*file*

    Send output to the specified file. If omitted, standard output is used.

__\--force__

    Drop the sample schema if it exists.

__\--keep__

    Don't delete the sample schema when the script finishes.

__\--limit=__*limit*

    As a numeric value, specifies the default number of rows to copy from
    each table (defaults to 100). Note that sample tables may end up with
    significantly more rows in order to satisfy foreign key constraints.

    If the value is a string, it is interpreted as a pattern/rule pair to
    apply to matching tables. Examples:

         # include all rows from the users table
         --limit="users = *"
        

        # include 1,000 rows from users table
        --limit="users = 1000"

        # include 10% of the total rows from users table
        --limit="users = 10%"

        # include all users where deactivated column is false
        --limit="users = NOT deactivated"

        # include all rows from all tables in the forums schema
        --limit="forums.* = *"

        # include 5% of total rows from each table in log schema
        # and 50% to the rest of tables
        --limit="log.* = 5%, * = 50%"

    The limit option may be specified multiple times. Multiple pattern/rule
    pairs can also be specified as a single comma-separated value. For example:

        # include all rows from the ads table; otherwise default to 300 rows
        --limit="ads=*,*=300"

    Rules are applied in order with the first match taking precedence.

__\--order=__*type*

    Supported asc, desc and random

__\--schema=__*name*

    The schema name to use for the sample database (defaults to _pg_sample).

__\--trace__

    Turn on Perl DBI tracing. See the DBI module documentation for details.

__\--gzip__

    Gzip dump.

__\--verbose__

    Output status information to standard error.

The following options control the database connection parameters.

__\-h__ _host_  
__\--host=__*host*

    The host name to connect to. Defaults to the PGHOST environment
    variable if not specified.

__\-p__ _port_  
__\--port=__*port*

    The database port to connect to. Defaults to the PGPORT environment
    variable, if set; otherwise, the default port is used.

__\-U__ _username_  
__\--username=__*username*

    User name to connect as.

__\-W__ _password_  
__\-password=__*password*

    Password to connect with.

# SEE ALSO

createdb(1), pg\_dump(1), psql(1)