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
* views - abstraction of table / multiple tables: merge tables and perform calculations and present data as if it were a table; typically read only
* others - languages, functions, triggers, types, sequences


## psql

`psql dbName`

* `-U`  / `--username`
* `-W` / `--password`  prompt for password
* no dbname uses user as db name


## psql commands 

* `\l` - list databases
* `\dt` - list tables
* `\dv` list views
* `\d` - list tables and views
* add an S!
* `\dn` - list schemas
* `\c db_name` - connect to different database
* `\d table_name` - describe table
* `\du` - list users
* `\i importScript.sql`
* `\h` - help on query



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

high level:

* numeric
* strings
* date and time
* _other_


## number types 

https://www.postgresql.org/docs/current/static/datatype-numeric.html

* serial (auto incrementing, pk if no "natural pk" apparent, called artificial / surrogate)
* smallint
* bigint
* decimal / numeric

## strings

* text - unlimited length
* varchar(n) - where n is num of characters (character varying)


## dates and times

* date
* time
* timestamp (no timezone)
* timestamptz (TIMESTAMP WITH TIMEZONE, use this!)
	* stored as UTC, queried in local tz


## lots of others!

https://www.postgresql.org/docs/9.5/static/datatype.html#DATATYPE-TABLE

* shapes (circle, polygon)
* documents (xml, json / jsonb)
* networking (inet for ipv4 and ipv6, cidr for ip ranges)
* currency (money 💰)


## about sql syntax

* case insensitive, but often uppercase keywords (or at least remain consistent)
	* again double quotes in column names - case sensitive
* end statements with ;
* comments --
* delimit strings with single quotes '
	* escape with extra ' (' --> '')
	* or use double $ as quotes $$what's this$$
* numbers are just literal values
* ISO 


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
	 netid varchar(20) PRIMARY KEY,
	 first varchar(255) NOT NULL,
	 last varchar(255) NOT NULL,
	 midterm numeric,
	 registered timestamptz DEFAULT NOW()
	 --student_id serial PRIMARY KEY,
	 --netid varchar(20) NOT NULL UNIQUE,
);
```


## time

```
EXTRACT
TIMESTAMP
TIMESTAMPTZ
```


## constraints and default

* `NOT NULL`
* `UNIQUE`
* `DEFAULT`


## create - insert

```
insert into student values ('fb123', 'foo', 'bar', 90);
insert into student (first, last, midterm, netid) values ('baz', 'qux', 70, 'bq789');
-- if using sequence
-- nextval('idsequence'),
```
* insert multiple rows: add commas to after each "tuple" of values


## read - select

* `AS`
* `WHERE`
	* `LIKE`
	* `ILIKE`
	* `AND / OR`
	* `=`, `<>`


## update - update

```
update student set midterm=80 where netid = 'fb123'

```


## delete - delete

```
delete from student where midterm > 90;
```


## add / modify / column - alter table


## view


## case


## aggregates 

* `AVG`
* `SUM`
* `MAX`
* `MIN`
* `COUNT`


## group by


## having

```
select count(*) as movie_count, director, round(avg(budget::numeric), 2)::money as avg_budget 
	from movie 
	group by director 
	having count(*) > 1 
	order by movie_count desc;
```


## rounding / formating

```
select title, director, round(cast (gross/budget as numeric), 2) as gob from movie order by gob desc;
```

* `cast ... as`
* 2 argument version of round requires numeric type



## update with another field

```
update movie set roi=(gross - budget)/budget;
```

## import


```
DROP TABLE IF EXISTS sd;
CREATE TABLE sd (
	sd_state text,
	sd_geoid text,
	sd_name text,
	sd_lowestGrade text,
	sd_highestGrade text,
	sd_pop_2010 integer,
	sd_hu_2010 integer,
	sd_aland real,
	sd_awater real,
	sd_aland_sqmi real,
	sd_awater_sqmi real,
	sd_intptlat real,
	sd_intptlong real,
	PRIMARY KEY(sd_geoid)
);
```
```
copy sd from '/tmp/Gaz_elsd_national.txt' delimiter E'\t' CSV header;
```
