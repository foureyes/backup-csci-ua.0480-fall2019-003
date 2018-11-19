---
layout: slides
title: "MongoDB Intro"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>


<section markdown="block">
## Relational Databases

__Remember when we talked about broad generalizations regarding relational databases? 🤔__ &rarr;

* {:.fragment} relational databases are typically pretty rigid:
	* {:.fragment} highly structured
	* {:.fragment} you have to define the columns and the types of columns before inserting rows
	* {:.fragment} has a lot of features for maintaining  _data integrity_ (such user defined data constraints, foreign keys, etc.)
* {:.fragment} some relational databases guarantee that transactions (or changes in the database) are reliable 
* {:.fragment} see [ACID compliance](https://en.wikipedia.org/wiki/ACID) - Atomicity, Consistency, Isolation, Durability

</section>


<section markdown="block">
## NoSQL Databases

__Let's contrast that with NoSQL databases (that is, _non SQL_, non relational, or even _Not Only SQL_ (how's that for a backronym?)!)__ &rarr;

So, some _stereotypes_ for NoSQL Databases, such as __key-value__ and __document stores__, are that they're:
{:.fragment}


* {:.fragment} more sometimes more simple in design and architecture
* {:.fragment} are less rigid / more flexible than relational databases
* {:.fragment} easier to scale "horizontally" (add more machines)
* {:.fragment} not necessarily normalized
* {:.fragment} the underlying structures aren't limited to tables (key-value, document, graph, etc.)

</section>

<section markdown="block">
## NoSQL Databases Continued

__Sounds good 👍 ... why didn't we start using these in the first place?__ &rarr;

Some compromises that a NoSQL database may have to make:

* {:.fragment} not usually ACID compliance
* {:.fragment} simple datastructures and architecture moves constraints and referential integrity to application layer
* {:.fragment} lack of standard (or at least mostly standard) language like SQL
* {:.fragment} some NoSQL systems even exhibit lost writes or data loss (because not ACID compliant)

Again, these are very broad generalizations (some NoSQL databases are ACID compliant)
{:.fragment}

</section>


<section markdown="block">
## Document Stores

Let's talk more about __document stores specifically__. __Data is organized (as the name implies) as semi-structured documents__ &rarr; 
* {:.fragment} think JSON (but there are many possible formats, such as XML, YAML, etc.)
* {:.fragment} or... a _richer_ key-value store (there's _meta data_ within the document... the keys are usually meaningful)
* {:.fragment} typically, no schema is required (that is, data types of values are inferred from values)
* {:.fragment} typically, semi structured (documents, property names, etc... do not have to be pre-defined)
* {:.fragment} some document stores are particularly featureful when it comes to high availability and scaling (through replication/redundancy and sharding/separating large databases into smaller ones)

They're particularly good for applications where flexible data storage or constantly changing data storage is required.
{:.fragment}
</section>

<section markdown="block">
## MongoDB

* MongoDB is a nosql database...
* Specifically, it's a document store
	* a single __record__ in Mongo is a __document__ 
	* a document is a bunch of key value pairs... 
	* hey... __that sounds like...__ &rarr; 
	* {:.fragment} documents are similar to JSON objects (actually BSON?)
</section>

<section markdown="block">
## Documents and Collections

A couple of 🔑 terms to remember (yay, definitions again!)

* __key__ - a field name - analogous to a column in a relational database
* __value__ - obvs, a value
* __document__ - a single object or record in our database, 
	* consists of key value pairs
	* similar to a single row in a relational database
* __collection__ - a group of documents 
	* analogous to tables in relational databases
</section>

<section markdown="block">
## Data Types

Although MongoDB doesn't require you to pre-define the types of values that your documents will have, it does have data types. These types __are inferred from the value__. Some available types include:


* __string__ - an empty string or an ordered sequence characters
* __numeric types__ - such as integer, double (float)
* __boolean__ - true / false
* __array__ -  a list of values
* __timpestamp__ - 64 bit value where first 32 bits are seconds since the Unix epoch
* __Object ID__ every MongoDB object or document must have an Object ID which is unique


</section>

<section markdown="block">
## ObjectID

The __Object ID__ is a 12-byte value, consists of: a 4-byte timestamp (seconds since epoch), a 5-byte random value, and a 3-byte counter

* {:.fragment} each document in a collection requires a primary key, `_id` that uniquely identifies it
* {:.fragment} if an inserted document doesn't have an `_id`, it will be automatically generated 

</section>

<section markdown="block">
## Installation

[Comprehensive docs are here](http://docs.mongodb.org/manual/installation/)

* basically, just [use the appropriate installer from their downloads page](http://www.mongodb.org/downloads)
* if you use a package manager, do that instead 
	* they have .debs for Debian and Ubuntu
	* since I'm on OSX, and I use homebrew, I used <code>brew install mongodb</code>
* starting will vary based on OS
* you may need to create and/or specify a directory where your data will be stored, so if mongo doesn't start up, it's missing its data directory
</section>	

<section markdown="block">
## A Whirlwind Tour

Working with MongoDB on the commandline...

If your OS doesn't autostart by default, you can run:

<pre><code data-trim contenteditable>
mongod
</code></pre>

To connect via the commandline MongoDB client and connect to a locally running instance:

<pre><code data-trim contenteditable>
mongo
</code></pre>

This drops you into the MongoDB shell (yay... more shell). You can issue commands that

* inspect the database
* modify and create documents and collections
* find documents
</section>

<section markdown="block">
## Some Commands

__The following commands can be used to navigate, create and remove databases and collections__ &rarr;

* `show databases` - show available databases (remember, there can be more than one database)
* `use db` - work with a specific database (if unspecified, the default database connected to is test)
* `show collections` - once a db is selected, show the collections within the database
* `db.dropDatabase()` - drop (remove) the database that you're currently in
* `db.collectionName.drop()` - drop (remove) the collection named `collectionName`

To get some inline help:

* `help` - get help on available commands

</section>

<section markdown="block">
## Starting Out

__To begin using the commandline client to inspect your data:__ &rarr;

1. make sure that `mongod` is running in a different window (or running _in the background_ or as a daemon)
2. start up the commandline client with `mongo`
3. type in `use databaseName` to switch to the database that you're looking through

From there, you can start querying for data, inserting documents, etc. These basic create, read, update, and delete operations are called __CRUD__ operations...


</section>
<section markdown="block">
## CRUD!?

__(C)reate, (R)ead, (U)pdate, and (D)elete operations:__ &rarr;

* {:.fragment} db.[collection].insert(obj)
	* <code>db.Person.insert({'first':'bob', 'last':'bob'})</code>
* {:.fragment} db.[collection].find(queryObj)
	* <code>db.Person.find({'last':'bob'})</code>
	* <code>db.Person.find() // finds all!</code>
* {:.fragment} db.[collection].update(queryObj, queryObj)
	* <code>db.Person.update({'first':'foo'}, {$set: {'last':'bar'}})</code>
* {:.fragment} db.[collection].remove(queryObj)
	* <code>db.Person.remove({'last':'bob'})</code>

<br>
Where `queryObj` is a name value pair that represents the property you're searching on... with a value that matches the value you specify
{:.fragment}
</section>

<section markdown="block">
## More Examples

__As prep for the next part, some insert and finds (with a test for greater than!)__ &rarr;

Inserting, finding all, then finding by exact number of lives:
{:.fragment}

<pre><code data-trim contenteditable>
> db.Cat.insert({name:'foo', lives:9})
WriteResult({ "nInserted" : 1 })
> db.Cat.find()
{ "_id" : ObjectId("57ff86a14639d0fd263f87a0"), "name" : "foo", "lives" : 9 }
> db.Cat.find({lives:9})
{ "_id" : ObjectId("57ff86a14639d0fd263f87a0"), "name" : "foo", "lives" : 9 }
</code></pre>
{:.fragment}

Inserting more, then using greater than!
{:.fragment}

<pre><code data-trim contenteditable>
> db.Cat.insert({name:'bar', lives:2})
WriteResult({ "nInserted" : 1 })
> db.Cat.insert({name:'qux', lives:5})
WriteResult({ "nInserted" : 1 })
> db.Cat.find({lives: {$gt: 4}})
{ "_id" : ObjectId("57ff86a14639d0fd263f87a0"), "name" : "foo", "lives" : 9 }
{ "_id" : ObjectId("57ff86c14639d0fd263f87a2"), "name" : "qux", "lives" : 5 }
</code></pre>
{:.fragment}

</section>


<section markdown="block">
## Importing Data

__Using a local mongodb instance... and the commandline client, `mongo`:__ &rarr;

Import files using `mongoimport`...
{:.fragment}


<pre><code data-trim contenteditable>
# json
mongoimport --db nyc --collection wifi --type json --file wifi3.json
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
# csv
mongoimport --db test --collection books --type csv --file books.csv --fieldFile books_fields.txt
</code></pre>
</section>

<section markdown="block">
## Adding and removing data

__A quick review of adding and removing data__ &rarr;

(oh yeah, don't forget to tab _a lot_)

* insert
	* `db.bar.insert({'greeting':'hello'})`
* delete
	* `db.remove({})`
* drop
	* drop collection: `db.bar.drop()`
	* `use` ... then `db.dropDatabase()`
</section>


<section markdown="block">
## Doin' Some Queryin' on Books

__A quick examination:__ &rarr;

* `show databases`
* `show collections`
* `from the collection db.COLLECTION_NAME`
* __do we have anything?__
	* `find()`
* __what's a book look like anyway?__
	* `findOne()`
* __how do we prevent our eyes from bleeding?__ (so many curly braces :( )
	* `pretty()`
	* maybe a failed experiment: `DBQuery.prototype._prettyShell = true in $HOME/.mongorc.js`
</section>

<section markdown="block">
##  Counting and Finding

* __what if we want to see exactly two books?__
	* `db.books.find().pretty().limit(2)`
* __how many there exactly?__ we could count. ugh. no.
	* `db.books.find().count()`
	* `db.books.count()`
* __can we show only books by the author of Pride and Prejudice?__
	* sure! hint: "Austen, Jane"
	* use a criteria object / document!
	* `db.books.find( {"AUTHOR":"Austen, Jane"} )`
* __how about figuring how many books there are by the guy that wrote war and peace?__ 
	* `db.books.find({"AUTHOR": "Tolstoy, Leo"}).count()`
</section>


<section markdown="block">
## Projections

* back to jane austen. __let's just see the title and year written of the book that we have on file__
	* use a project object / document!
	* `db.books.find( {"AUTHOR":"Austen, Jane"}, {_id:0, "TITLE":1, "YEAR_WRITTEN": 1} )`
* do the same, but exclude only the id
	* `db.books.find( {"AUTHOR":"Austen, Jane"},{_id:0})`
* __can supress edition, but include title?__
	* nah, nope, blah ... not this way:
	* `db.books.find( {"AUTHOR":"Austen, Jane"},{"EDITION":0,"TITLE":1,"YEAR_WRITTEN":1})`
	* can't mix inclusions and exclusions... can only mix supressing id
	* OOORRR ... just don't include
	* `db.books.find( { },{_id:0,"AUTHOR":1,"TITLE":1,"YEAR_WRITTEN":1})`
</section>


<section markdown="block">
## Sorting

* let's try some sortin' __sort by author, then title__
	* `db.books.find( { },{_id:0,"AUTHOR":1,"TITLE":1,"YEAR_WRITTEN":1}).sort({"AUTHOR":1,"TITLE":1})`
* __how about by year ascending?__
	* `db.books.find( { },{_id:0,"AUTHOR":1,"TITLE":1,"YEAR_WRITTEN":1}).sort({"year_written":1})`
* __how about descending order by year?__
	* use -1 instead of 1 (of course 🤷‍)
	* `db.books.find( { },{_id:0,"AUTHOR":1,"TITLE":1,"YEAR_WRITTEN":1}).sort({"YEAR_WRITTEN":-1})`
</section>

<section markdown="block">
## Comparisons

* ok... now try some comparisons. 
* `db.books.find( {"YEAR_WRITTEN":{$gte:1870}},{ _id:0} )`
* __how about1870 and 1900 (inclusive)__ &rarr;
	* `db.books.find( {"YEAR_WRITTEN":{$gte:1870, $lte: 1900}},{ _id:0} )`
* __...and sort the result by author__
	* `db.books.find( {"YEAR_WRITTEN":1900},{ _id:0} ).sort({"AUTHOR":1})`
* __anything written exactly in 1870?__
	* `db.books.find( {"YEAR_WRITTEN":1870},{ _id:0} ).sort({"AUTHOR":1})`
</section>

<section markdown="block">
## Operators

* __books that cost $15 or more; or were written in 1900 or later__
	* `db.books.find({ "$or":[ {"PRICE":{"$gte":15}},{"YEAR_WRITTEN":{"$gte":1900}}]})` 
* __same with author, title, year and price__
	* `db.books.find({ "$or":[ {"PRICE":{"$gte":15}},{"YEAR_WRITTEN":{"$gte":1900}}]},{_id:0,"AUTHOR":1,"TITLE":1,"YEAR_WRITTEN":1,"PRICE":1})`
* __now sort by author and title__
	* `db.books.find({ "$or":[ {"PRICE":{"$gte":15}},{"YEAR_WRITTEN":{"$gte":1900}}]},{_id:0,"AUTHOR":1,"TITLE":1,"YEAR_WRITTEN":1,"PRICE":1}).sort({"AUTHOR":1,"TITLE":1})`
</section>

{% comment %}
* $ <-- operation
* $push push something to an array
* $or?
* $set will update a document

{AUTHOR:"Tolstoy, Leo", YEAR:1800}
wifi
-----
* __how do we show databses?__
* __how about switch databases?__ switch to nyc
* __um...how do we know what we have?__
* __let's show only the cities__
	* db.wifi.find({}, {"CITY":1})
* __get only the ones in the bronx__
* __get only the ones that are free?__ 
* __get only the ones that are free and in flushing?__ 
* __are there any that are free and in the bronx?__ 
* __how about either in the bronx or price is free?__ 
	* db.wifi.find({"$or":[{"CITY":"Bronx"}, {"TYPE":"Free"}]})
* __how about either in flushing or price is fee based?__ 
* __that's a mess... let's limit the fields to city and type__
* __sort by alphabetical order by city__
* __descending__

wifi again
-----
* __only in bronx or flushing!?__
	* db.wifi.find({'CITY': {$in:['Flushing', 'Bronx']}})
* __only city, and keep id out of it puhleeze__
	* db.wifi.find({'CITY': {$in:['Flushing', 'Bronx']}}, {"CITY":1, "_id":0})
* __not in bronx or flushing!?__
	* db.wifi.find({'CITY': {$nin:['Flushing', 'Bronx']}}, {"CITY":1, "_id":0})

pets
-----
* only the cutest pets, plz
* that are cats, of course

{% endcomment %}
