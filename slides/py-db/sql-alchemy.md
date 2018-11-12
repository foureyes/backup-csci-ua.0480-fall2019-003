---
layout: slides
title: "SQL Alchemy"
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## SQL Alchemy

Another library for interacting with a relational database is [SQL Alchemy](https://www.sqlalchemy.org/). __It offers multiple ways of working with your database.__ &rarr;

* {:.fragment} it can be used to issue __raw SQL queries__
* {:.fragment} its __expression language__ allows you to skip SQL entirely and use equivalent Python methods
* {:.fragment} it also offers a full-feature __object-relational mapper__ (ORM)  that maps table rows to _actual_ instances of Python objects
* {:.fragment} install with `pip` or `conda`

</section>
<section markdown="block">
## An Overview...

__SQL Alchemy is pretty large library and it can be a bit daunting to learn__ &rarr;

* we'll check out a quick survey of how it works
* ... in order of increasing abstraction
* (low level SQL queries first... up to using an object-relational mapper)
</section>

<section markdown="block">
## Raw SQL

<pre><code data-trim contenteditable>

from sqlalchemy import create_engine

db = create_engine("postgres://localhost/databasename")

artworks = db.execute("""select artwork.title, artwork.artwork_date
from artist
inner join artist_artwork on artist.artist_id = artist_artwork.artist_id
inner join artwork on artist_artwork.artwork_id = artwork.artwork_id
where artist.name ilike '%%marina%%'
""")

for a in artworks:
    print(a)
</code></pre>

</section>

<section markdown="block">
## create_engine, execute

__The `Engine` is the entry point object for an SQL Alchemy based application; it defines__ &rarr;

* {:.fragment} the dialect of SQL used (for example postgres vs MS SQL Server) and the pool of connections to work with
* {:.fragment} ...and is created by passing a database connection string to the `create_engine` function:
	* `postgres://username:password@hostname/databasename`
	* [see the official docs on SQL Alchemy `Engine`](https://docs.sqlalchemy.org/en/latest/core/engines.html)

`execute` can be called on the engine object directly to issue raw SQL queries... 
{:.fragment}

</section>
<section markdown="block">
## Other Operations

__Of course, because this is just raw SQL, you can modify the database as well. Here is an example of inserting... and then immediately removing an artist__ &rarr;


Note that we parameterize the values here...
{:.fragment}

<pre><code data-trim contenteditable>
q = "insert into artist (artist_id, name, bio) values (%s, %s, %s)"
db.execute(q, 123456, 'joe versoza', "i'm not really an artist! or am i!?")
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
db.execute('delete from artist where artist_id = 123456')
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## Expression Language

__Setup__ &rarr;
<pre><code data-trim contenteditable>
from sqlalchemy import create_engine
from sqlalchemy import Table, Column, String, Integer, MetaData

db = create_engine("postgres://localhost/scratch")

meta = MetaData(db)
artist_table = Table('artist', meta,
                       Column('artist_id', Integer),
                       Column('name', String),
                       Column('bio', String))

</code></pre>

* note that we're creating an object that represents the artist table
* it provides SQL Alchemy with some meta data about `artist`
</section>

<section markdown="block">
## Create

__Now... we explicitly connect (this was done implicitly for us with execute previously) and insert some data__ &rarr;

<pre><code data-trim contenteditable>
with db.connect() as conn:
    s = artist_table.insert().values(artist_id=123456, name="joe v", bio="i'm an artist!?")
    conn.execute(s)
</code></pre>
{:.fragment}

Note that instead of using raw sql, we're using a `Table` object and equivalent methods for `insert`, `values`, etc.
{:.fragment}

</section>

<section markdown="block">
## Read

__Here's another example where we simply read data__ &rarr;

<pre><code data-trim contenteditable>
    s = artist_table.select().where(artist_table.c.name == 'joe v')
    artists = conn.execute(s)
    for artist in artists:
        print(artist)
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## ORM Style!

__Setup (so many imports 😅)__

<pre><code data-trim contenteditable>
from sqlalchemy import create_engine
from sqlalchemy import Column, String, Integer
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
</code></pre>
{:.fragment}


Of course... create the engine
{:.fragment}

<pre><code data-trim contenteditable>
db = create_engine("postgres://localhost/scratch")
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Create an Artist Class

__Create a class that represents artists in the database__ &rarr;

(start with retrieving the base class used for SQL Alchemy ORM classes)
{:.fragment}

<pre><code data-trim contenteditable>
# get the base class for all classes that you create
base = declarative_base()

class Artist(base):
    __tablename__ = 'artist'

    artist_id = Column(Integer, primary_key=True)
    name = Column(String)
    bio = Column(String)
</code></pre>
{:.fragment}

* note that these are kind of like _static_ variables (not instance!)
{:.fragment}


</section>

<section markdown="block">
## Let's Make Some Artists

__To insert, create a new instance of `Artist` and `add` it to the session to persist it__ &rarr;

<pre><code data-trim contenteditable>
Session = sessionmaker(db)
session = Session()

a = Artist(artist_id=123456, name="joe v", bio="yes, i'm an artist, ok!?")
# add this new object to our session so we can persist it
session.add(a)
session.commit()
</code></pre>
{:.fragment}

[Note that there are multiple ways to execute queries; using the session is recommended when working with the ORM](https://stackoverflow.com/questions/34322471/sqlalchemy-engine-connection-and-session-difference)
{:.fragment}

</section>

<section markdown="block">
## Reading 

__And, for good measure, let's try a select... this time, `filter` takes the place of `where`__

<pre><code data-trim contenteditable>
artists = session.query(Artist).filter(Artist.name == 'joe v')
for a in artists:
    print(a.name)
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Which One to Use?

__Uh... so many ways to get data from the database. Which one should we use and why?__ &rarr;

* {:.fragment} want exact control over how your query is created? raw sql
* {:.fragment} vaguely know sql, but can read python documentation well? expression language or orm
* {:.fragment} don't want random sql sprinkled throughout your app? orm
</section>
