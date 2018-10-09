## postgres background

* relational
* "object oriented"
	* overload functions
	* inheritance 
	* extensible type system!
* only use the relational part


## Installation

* all platforms - binary
* MacOS - brew
* Windows - WSL (see linux) or binary
* Linux - apt / pacman / etc. 


## Server / Client

* installation installs both server and client
* server must be running
* client can be commandline or graphical (rn only graphical)
	* psql
	* pgAdmin
	* DataGrip
* currently both server and client local
* eventually, server on remote machine!


## Start, Stop, Restart

* `pg_ctl start` 
	* `-D datadir`
	* `-l filename` 
	* (on MacOS) `pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start`
* `pg_ctl stop`
* `pg_ctl restart` - stop and then start
* `pg_ctl reload` - reread config, but no need to completely stop and start again
* `PGDATA` - export, `.bashrc` or `bash_profile` (or config)


## Configuration

* `pg_hba.conf`
	* who can access
	* more about permissions, roles, security in next few classes
* `postgreql.conf` (logging, data dir, etc.)


## Postgres Object Hierarchy

* templates
* databases - multiple databases allowed in one instance of postgres
* schemas - (ANSI SQL standard) next level organization in database
	* database -> schema -> table
	* name spacing - useful for organizing many tables
	* default schema is public
	* we likely won't have to deal with schemas in the class
* tables
* views
* others - languages, functions, triggers, types, sequences


## psql

`psql dbName`

* `-U`  / `--username`
* `-W` / `--password`  prompt for password


## psql commands 

* `\l` - list databases
* `\dt` - list tables
* `\dn` - list schemas
* `\c db_name` - connect to different database
* `\d table_name` - describe table
* `\du` - list users
* `\i importScript.sql`

## naming conventions

* quoted table name is case sensitive
* unquoted normalizes to lowercase (maybe bad depending on your table names)
* make table names:
	* lowercase
	* words separated by underscore
	* very descriptive
	* underscore id (foo_id) for foreign keys (more on this later)
	* be consistent with pluralization (maybe _prefer_ singular: user vs users)

## types

number types https://www.postgresql.org/docs/current/static/datatype-numeric.html

* serial (auto incrementing, pk if no "natural pk" apparent)
* smallint
* bigint
* decimal / numeric

strings

* text
* varchar (n characters)

dates and times

* date
* time
* timestamp (no timezone)
* timestamptz (TIMESTAMP WITH TIMEZONE, use this!)


## about sql syntax

* case insenstive, but often uppercase keywords (or at least remain consistent)
* end statements with ;
* comments --


## creating a database

* character encoding
* collation (sort order of characters)
* clones template1 (also a template 0)

```
CREATE DATABASE someDatabaseName;
```


## creating a table


```
CREATE TABLE student(
	 student_id serial PRIMARY KEY,
	 first VARCHAR(255) NOT NULL,
	 last VARCHAR(255) NOT NULL,
	 midterm NUMERIC,
	 netid VARCHAR(20) NOT NULL UNIQUE,
	 registered timestamptz DEFAULT NOW()
);
```


## constraints and default

* `NOT NULL`
* `UNIQUE`
* `DEFAULT`

## create - insert

```
insert into student values ('foo', 'bar', 10, 'fb123')
insert into student (first, last, midterm, netid) values ('foo', 'bar', 10, 'fb123')
-- nextval('idsequence'),
```

## read - selections

## update



