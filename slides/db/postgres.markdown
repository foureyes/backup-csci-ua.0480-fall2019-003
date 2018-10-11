---
layout: slides
title: "Postgres Basics"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}


### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>


<section markdown="block">
## PostgreSQL Background

__Database category:__

* relational
* __AND__ "object oriented"
	* allows overloaded functions
	* table inheritance 
	* extensible type system!

(We'll only be using the relational features, though)

</section>

<section markdown="block">
## Installation

__For all platforms, you can use the [installer](https://www.postgresql.org/download/)__

* it _should_ prompt you for a username and password
* make sure you remember it (username is postgres)

__If you're on MacOS:__

* preferred installation is to use [homebrew](https://brew.sh/)
	* `brew install postgresql`
	* watch output of install, and copy command given
	* (`pg_ctl -D /usr/local/var/postgres start` # start server!)
	* super user is your username, no password if connect locally
* Linux or Windows 10 - WSL 
	* Linux - apt / pacman / etc. (super user is `postgres`)


</section>

<section markdown="block">
## Server / Client

__Installation installs both server and client:__

* server must be running in order for it to be queried
	* server will run in background when using `pg_ctl`
	* (you can close tab, and it'll still be running)
* client can be commandline or graphical (rn only use commandline)
	* `psql` - commandline client
	* pgAdmin - graphical
	* DataGrip - graphical, not gree
* currently both server and client local (on same machine)
* eventually, server on remote machine!


</section>

<section markdown="block">
## Start, Stop, Restart

* `pg_ctl start` 
	* `-D datadir` - directory where postgres stores data
	* `-l filename` - where to log output
	* (on MacOS) `pg_ctl -D /usr/local/var/postgres start`
	* add `-l /usr/local/var/postgres/server.log`
* `pg_ctl stop`
* `pg_ctl restart` - stop and then start
* `pg_ctl reload` - reread config, but no need to completely stop and start again

Want to stop specifying the `-D` when starting?

* {:.fragment} `export PGDATA=/foo/bar`, add export to`.bashrc` or add export to `bash_profile` ... or modify `postgresql.conf`


</section>

<section markdown="block">
## Configuration

* `pg_hba.conf`
	* who can access / where they can access from
	* more about permissions, roles, security in next few classes
* `postgreql.conf` (logging, data dir, etc.)
* locations:
	* `/usr/local/var/postgres/pg_hba.conf`
	* `/usr/local/var/postgres/postgresql.conf`

Or... when connected to any database through `psql`:

`SELECT name, setting FROM pg_settings WHERE category = 'File Locations';`


</section>

<section markdown="block">
## Postgres Object Hierarchy

* templates
* databases - multiple databases allowed in one instance / "cluster" of postgres
* schemas - (ANSI SQL standard) next level of organization in database
	* database -> schema -> table
	* name spacing - useful for organizing many tables
	* default schema is `public`
	* we likely won't have to deal with schemas in the class
* tables
* views - abstraction of table / multiple tables: merge tables and perform calculations and present data as if it were a table; typically read only
* others - languages, functions, triggers, types, sequences

</section>

<section markdown="block">
## psql

__Commandline client: `psql` (should be installed when postgres is installed)__ &rarr;

Usage `psql dbName`: where `dbName` is name of database to connect to.

Optional flags include:

* `-U`  / `--username`
* `-W` / `--password`  prompt for password
* no dbName uses user name as db name



</section>

<section markdown="block">
## psql Commands 

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



</section>

<section markdown="block">
## Naming Conventions

* quoted names are case sensitive
* unquoted normalizes to lowercase (maybe bad depending on your table names)
* ...so make table names and column names:
	* lowercase
	* words separated by underscore
	* very descriptive
	* underscore id (foo_id) for foreign keys (more on this later)
	* be consistent with pluralization (always either use singular or always use plural)


</section>

<section markdown="block">
## Types

__PostgreSQL has _a lot_ of types (you can even create your own!)__

These are some high level categories where these types can fit in:

* {:.fragment} numeric
* {:.fragment} strings
* {:.fragment} date and time
* {:.fragment} _other_


</section>

<section markdown="block">
## Number Types 

__Check the docs on [numeric data types](https://www.postgresql.org/docs/current/static/datatype-numeric.html)__ &rarr;

* `serial` (auto incrementing, pk if no "natural pk" apparent, called artificial / surrogate)
* `integer` - typical choice for integer, 4 bytes
* `smallint` - 2 bytes, signed
* `bigint` - 8 bytes, signed
* `decimal` / `numeric` - arbitrary precision numbers

</section>

<section markdown="block">
## Strings

__See docs on [character data types](https://www.postgresql.org/docs/current/static/datatype-character.html)__ &rarr;

* `text` - unlimited length
* `varchar(n)` - where `n` is num of characters (character varying)

⚠️If casting to lesser length, string will be truncated to fit!

</section>

<section markdown="block">
## Dates and Times

See [docs on Date/Time types](https://www.postgresql.org/docs/current/static/datatype-datetime.html)

* `timestamptz` (timestamp __with timezon__, __use this__!)
	* stored as UTC, queried, shown in local time zone
* `timestamp` (no timezone)
* `date`
* `time`


</section>

<section markdown="block">
## Many Others!

__Check out this [table of all data types](https://www.postgresql.org/docs/10/static/datatype.html#DATATYPE-TABLE)!__ &rarr;

* {:.fragment} currency (`money` 💰)
	* will use the currency based on os-level localization settings
	* will format appropriately (commas, currency symbol, dots, etc.)
* {:.fragment} shapes (`circle`, `polygon`)
* {:.fragment} documents (`xml`, `json` / `jsonb`)
* {:.fragment} networking (`inet` for ipv4 and ipv6, `cidr` for ip ranges)


</section>

<section markdown="block">
## About SQL Syntax

__Whitespace (newlines, tabs) is ok within a statement, so formatting code with line breaks and indentation for readibility is encouraged!__

* {:.fragment} end statements with `;`
* {:.fragment} comments start with `--`
* {:.fragment} SQL keywords can be written in upper or lower case
	* but it's common practice to uppercase keywords 
	* (or at least remain consistent)

Note that in postgres:
{:.fragment}

* when writing SQL, names of objects are lowered
* (double quote if you don't want this behavior) 
* so - in postgres - __avoid uppercase letters in names of objects so that quoting isn't required__
{:.fragment}


</section>

<section markdown="block">
## Strings, Numbers, NULL 

__Delimit strings with single quotes `'`__ &rarr;

* escape with extra `'` (`'` --> `''`)
* or use double $ as quotes `$$what's this$$`
* `E'\t'` - prefix with E to use \ as escape character

__Numbers are just numeric literals: `5`, `1.23`__

__`NULL` means no value or missing value__

</section>
<section markdown="block">
## Creating a Database

__A database can have the following attributes__

* character encoding
* collation (sort order of characters)
* clones template1 (also a template 0)

To create a table:

<pre><code data-trim contenteditable>
CREATE DATABASE someDatabaseName;
--uses same encoding and collation as template1
</code></pre>

See [CREATE DATABASE](https://www.postgresql.org/docs/10/static/sql-createdatabase.html) docs


</section>

<section markdown="block">
## Creating a Table Background Info

See [CREATE TABLE](https://www.postgresql.org/docs/10/static/sql-createtable.html) doc

* `CREATE TABLE`
* followed by table name
* in parens...
	* comma separated list of column names and their type separated by space:
	* `first_name` varchar(255)
* can specify some constraints after type, such as:
	* `NOT NULL`
	* `UNIQUE`
	* `PRIMARY KEY`
* default value specified with:
	* `DEFAULT value_to_default_to`
</section>

<section markdown="block">
## Creating a Table Example

__Create a student table with 5 fields: netid first, last, midterm and registered__ &rarr;

<pre><code data-trim contenteditable>
CREATE TABLE student(
	 netid varchar(20) PRIMARY KEY,
	 first varchar(255) NOT NULL,
	 last varchar(255) NOT NULL,
	 midterm numeric,
	 registered timestamptz DEFAULT NOW()
);
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Create (INSERT)

__To add a new row to a table, use an <span class="hl">INSERT</span> statement__ &rarr;

<pre><code data-trim contenteditable>
-- values in order of field names (registered
-- left out, as it has a default value)
INSERT INTO student 
	VALUES ('fb123', 'foo', 'bar', 90);
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
-- specify columns and matching values (does not have 
-- to follow same order of columns in CREATE TABLE
INSERT INTO student 
	(first, last, midterm, netid) 
	VALUES ('baz', 'qux', 70, 'bq789');
</code></pre>
{:.fragment}

* {:.fragment} insert multiple rows: add commas to after each "tuple" of values
* {:.fragment} [See docs on INSERT](https://www.postgresql.org/docs/current/static/sql-insert.html)

</section>

<section markdown="block">
## Read (SELECT)

__Use a <span class="hl">SELECT</span> statement to _read_ data__ &rarr;

* start with `SELECT`
* followed by a comma separated list of columns or calculated values you'd like to see
	* you can use `AS some_alias` to alias column names or name calculations
	* `*` means all columns
	* arithmetic operators and functions / expressions can be used here!
* then keyword `FROM tablename` ...to specify which table to query

</section>

<section markdown="block">
## `SELECT` Examples

__Using the student table created earlier__ &rarr; 

* {:.fragment} get all students
	<pre class="fragment"><code data-trim contenteditable>
SELECT * FROM student;
</code></pre>
* {:.fragment} get all students, just netid, first, and name last name ... and alias first as fn
	<pre class="fragment"><code data-trim contenteditable>
SELECT netid, first as fn FROM student;
</code></pre>
* {:.fragment} get all students, show net id and midterm grade divided by 100
	<pre class="fragment"><code data-trim contenteditable>
SELECT netid, midterm / 100 FROM student;
</code></pre>

</section>


<section markdown="block">
## `SELECT` with `WHERE` Clause

__Optionally, add a `WHERE` clause to specify _conditions_ (think filtering)__ &rarr;

* conditions can use operators like `=`, `<>` (not equal), `>`, `<`
* you can also use `LIKE` and `ILIKE` with `%` representing _wildcards_ to match on substrings (`ILIKE` is case insensitive)
* use `colName IS NULL` to check for a `NULL` value
* multiple conditions can be put together with `AND`, `OR`, `NOT`
* parentheses can be added to specify precedence
</section>

<section markdown="block">
## `SELECT` + `WHERE`

__Filter your `SELECT` statement results with a `WHERE` clause__ &rarr;

* {:.fragment} only students with midterm > 80
	<pre><code data-trim contenteditable>
SELECT * FROM student WHERE midterm > 80;
</code></pre>
* {:.fragment} only students with between 70 and 90
	<pre><code data-trim contenteditable>
SELECT * FROM student 
	WHERE midterm > 70	
	AND midterm < 90;
</code></pre>

</section>

<section markdown="block">
## `SELECT` + `WHERE` Contined


* {:.fragment} only students with midterm > 80
	<pre><code data-trim contenteditable>
SELECT * FROM student WHERE midterm > 80;
</code></pre>
* {:.fragment} only students with between 70 and 90
	<pre><code data-trim contenteditable>
SELECT * FROM student 
	WHERE midterm > 70	
	AND midterm < 90;
</code></pre>

</section>

<section markdown="block">
## `ORDER BY`

</section>

<section markdown="block">
## update - update

```
update student set midterm=80 where netid = 'fb123'

```


</section>

<section markdown="block">
## delete - delete

```
delete from student where midterm > 90;
```


</section>

<section markdown="block">
## add / modify / column - alter table


</section>

<section markdown="block">
## view


</section>

<section markdown="block">
## case


</section>

<section markdown="block">
## aggregates 

* `AVG`
* `SUM`
* `MAX`
* `MIN`
* `COUNT`


</section>

<section markdown="block">
## group by


</section>

<section markdown="block">
## having

```
select count(*) as movie_count, director, round(avg(budget::numeric), 2)::money as avg_budget 
	from movie 
	group by director 
	having count(*) > 1 
	order by movie_count desc;
```


</section>

<section markdown="block">
## rounding / formating

```
select title, director, round(cast (gross/budget as numeric), 2) as gob from movie order by gob desc;
```

* `cast ... as`
* 2 argument version of round requires numeric type



</section>

<section markdown="block">
## update with another field

```
update movie set roi=(gross - budget)/budget;
```

</section>

<section markdown="block">
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
</section>














