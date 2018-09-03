---
layout: slides
title: Intro
---
<section markdown="block" class="intro-slide">

# {{ site.vars.course_name }}

### {{ site.vars.course_number}}

#### (Hi 👋)
</section>

<section markdown="block">

## What _is_ This?


Special Topics - __{{ site.vars.course_name }}__ 
{:.fragment}

* {:.fragment} (v catchy name)

Course Number __{{ site.vars.course_number }}__, Section __{{ site.vars.course_section }}__
{:.fragment}

* {:.fragment} (are you in the right class? 🤷‍♂️)

</section>

<section markdown="block">
## Today!

Here's what we'll be covering today:

__In these slides...__ &rarr;

1. {:.fragment} course topics ✅
2. {:.fragment} introductions 👋
3. {:.fragment} workload 😅

__And then...__ &rarr;
{:.fragment}

1. {:.fragment} tools 🔨
2. {:.fragment} maybe some python stuffs 🐍
</section>

<section markdown="block">
## Topics

### U Will Learn Some Stuff, Like...
{:.fragment}


* {:.fragment} finding data 👀
* {:.fragment} cleaning data 🛀
* {:.fragment} "wrangling" data 🤠
* {:.fragment} storing data 🗄
* {:.fragment} _loving_ and _caring_ for your data as if it were your own tiny toddler child (made of 1's and 0's) ❤️👶💻
	* {:.fragment} (what does that _even_ mean??? idk!) 

{:.fragment}
</section>


<section markdown="block">
## Topics (Really)

The semester will be broken down into <span class="hl">three parts</span>:

1. {:.fragment} __Finding, retrieving, scrubbing, transforming, and visualizing data__
	* {:.fragment} (with Python 3.x, numpy, pandas, matplotlib, requests, html, jupyter, etc.)
2. {:.fragment} __Designing a data model, storing data in a database, manipulating data in a database__
	* {:.fragment} (with PostgreSQL, MongoDB, an Python 3.x as _glue_ sometimes)
3. {:.fragment} __Visualizing data (on the web this time), deploying _in the cloud_, working with large data sets__
	* {:.fragment} (flask, chalice or zappa, s3, rds, Apache Spark or Hadoop)

</section>


<section markdown="block">
## \#goals

Basically ...  you'll be <span class="hl">learning how to use various tools to build end-to-end data pipelines </span>: 

From sourcing data &rarr; to using that data for some _useful_ purpose.
{:.fragment}

* {:.fragment} __ETL__ <span class="fragment">(<strong>E</strong>xtract <strong>T</strong>ransform and <strong>L</strong>oad)</span>
	* {:.fragment} extracting data from single / multiple sources, cleaning and trasnforming data to a adhere to a particular format, and loading data into persistent storage
* {:.fragment} __+ _something useful_ ...__
	* {:.fragment} visualization on the web 📈🕸
	* {:.fragment} deployment in the cloud ☁️
	* {:.fragment} analysis of large data sets Σ

</section>

<section markdown="block">
## This is Not...

__This course isn't about...__

* {:.fragment} Machine learning 🚫
* {:.fragment} Language processing 🚫

__We'll touch on the following topics, but it'll only be introductory material__
{:.fragment}

* {:.fragment} Data visualization on the web 🤷‍
* {:.fragment} Large scale web apps 🤷‍
* {:.fragment} Big data 🤷‍
* {:.fragment} Cloud computing 🤷‍
</section>

<section markdown="block">
## About... You

__I expect (hope?) that you__:

1. {:.fragment} are comfortable quickly picking up basics of a new programming language
	* {:.fragment} Python, SQL ...and to a lesser extent, JavaScript and SVG
2. {:.fragment} are _ok_ using the __commandline__
3. {:.fragment} have the ability to install tools, software, etc.
4. {:.fragment} are able __navigate__ through your __file system__ 
5. {:.fragment} 
5. {:.fragment} <strong>_actually do homework and - you know - occasionally come to class_</strong> 

</section>

<section markdown="block">

## DO U NO THIS?

* {:.fragment} do __you do this professionally__ 
	* {:.fragment} are you already an ETL engineer?
	* {:.fragment} data scientist? 
* {:.fragment} or... have __already taken several web minor courses__ ?
	* (specifically CSCI-UA.0060, the course on databases)

</section>

<section markdown="block">
## YES, I ALREADY KNOW THIS STUFF ✋

If you're already __familiar__ with this material... &rarr;

* {:.fragment} there may be __signficant overlap__ with the material in the __web minor databases class__
* {:.fragment} your professional work may be very similar (or even more advanced) than what we cover in class
* {:.fragment} so... <span class="hl">you should give some thought as to whether or not you should stay enrolled</span> in this course

<br>
Since this is the first run of the course and you're already enrolled, I can't tell you to drop and take another class (that's up to you!)
{:.fragment}
</section>

<section markdown="block">
## What About Python 🐍?

__If you__... 

* already took <span class="hl">0002</span> (intro to programming) 
* or if you have some beginner <span class="hl">Python experience</span>

It's ok! ✋
{:.fragment}

* {:.fragment} we'll go over some intermediate python features
* {:.fragment} and some libraries you _may_ not be familiar with yet 
</section>

<section markdown="block">
## Ok, So... About Me

### Joe Versoza

* {:.fragment} I also teach AIT (perhaps u kno of this), an intro to Python course, and sometimes 101 or a grad course here and there
* {:.fragment} I'm a __Clinical Assistant Professor__ (you can find me at: {{ site.vars.office_hours_room }})
* {:.fragment} I'm _maybe_ qualified to teach this
	* {:.fragment} My industry background included aggregating data from multiple sources (a postgresql database for a web app, fixed with files dropped off at an ftp server etc.)
	* {:.fragment} and storing that data in a data warehouse or operational data stores
	* {:.fragment} I've worked with postgres years ago with functions, stored procedures etc. (perhap outside the scope of this course)
    * {:.fragment} (turns out, managing programmers is _not so fun_ &#128557; &#128514; &#128528;) 
    * {:.fragment} also worked as software engineer for a looong time - mostly with &#128013; ([web.py](http://webpy.org/) and [Django](https://www.djangoproject.com/), and even some [flask](http://flask.pocoo.org/)), but with some [Rails](http://rubyonrails.org/), [PHP](http://en.wikipedia.org/wiki/PHP), [Java/JSP](http://en.wikipedia.org/wiki/JavaServer_Pages) too...

<aside class="notes">
Why would you ever take another class with me?
Really love teaching. Left great full time job management/programming job to teach!
FYI, also - for coders - management is difficult, but it's a legit career track
</aside>
</section>


<section markdown="block">
## Workload 

There's a __significant amount of work__ involved in this class:

* {:.fragment} 2 x exams (__final is last day of class, not during finals week!__)
* {:.fragment} 8 or 9 x [homeworks](../../#hw-policy) 
    * __Write your own code!__
    * some examples of homework are:
        * write your own library that _does x_
        * use that library to implement some sort of web application
        * use an existing library that already _does x_ to re-write above ^
* {:.fragment} 8 x [online quizzes](../../#quiz-policy) (taken from home)
* {:.fragment} 1 x final project
    * essentially, a single web app based on material we've learned
    * details to be posted mid-semester
</section>

<section markdown="block">
## Difficulty Level

This course is not challenging in the way that something like _algorithms_ is, but __it's challenging because of__: 

* {:.fragment} the __wide range of topics__ covered
* {:.fragment} the __volume of hands-on work__ (again, though, no more than weekly assignments in some intro classes)
* {:.fragment} the  __difficult nature of debugging__ web applications that involve integrating several technologies

</section>

<section markdown="block">
## About that Homework

__On the subject of homework and difficulty level, if you need help__ &rarr;


* {:.fragment} __please ask on piazza__ - public posts are encouraged as long as you're not posting significant parts of the homework solution
* {:.fragment} high level discussions with other students are ok
* {:.fragment} help debugging an exception/error from other students is ok
* {:.fragment} see me or the tutor (office / tutoring hours)

<br>

Using online resources outside of the course materials...
{:.fragment}

* {:.fragment} is __ok if it's just a line or two and you annotate your code with a comment and a link__ ... for example:
    * a snippet of example code directly from documentation
    * a couple of lines from stackoverflow to get a library working 
* {:.fragment} is __not ok__ you're lifting significant amount of code from an online tutorial or another project found online

</section>

<section markdown="block">
## Writing Your Own Code

Whatever you do, though... __write your own code!__ This means:

* {:.fragment} __don't copy__ (clone, download, etc.) anyone else's code 👯
* {:.fragment} __don't distribute/publish your code__ (including publishing to a public git repository or posting in a forum) 🚫
    * (You can publish your final project once the class is over)

<br>

The Director of Undergraduate Studies will handle any instances of cheating or software plagiarism
{:.fragment}




</section>


<section markdown="block" data-background="#440000">
## Oh Yes - Did You Remember the Part About __Writing Your Own Code__?

</section>

<section markdown="block">
## Too Easy/Difficult, Too Much Work?

__Consider choosing a different course if 🤔 ...__

1. {:.fragment} _are a __professional__ web developer_ or __already know this stuff__ 😮
2. {:.fragment} think this may be __more work than you accommodate__ this semester 😰
3. {:.fragment} __not comfortable with the requirements__ (commandline, basic html, css, etc.) 😟
4. {:.fragment} you're a senior and want an easy C to meet your cs major requirements 🎓

</section>

<section markdown="block">
## How to Make No One Happy

Students coming into the course __have very different backgrounds when it comes to web development__ (from _What's a CSS?_ to _You mean this course doesn't go into using Redux?_) &rarr;

* {:.fragment} Sooo... I try to hit the __middle ground__
* {:.fragment} for students with no previous experience, it's a: "__Hard class for me (no previous exp to webdev) but is fair. There should be a prereq to this class not to let people like me take the class.__"
* {:.fragment} and for students with web development experience: "__General pace was good - could have maybe been a little faster.__"
* {:.fragment} just can't make anyone happy  &#128580; ... though one comment was __(a drawing of a cat)__
* {:.fragment} general consensus in evaluations (biased towards people who attend class) is: __a lot of work, but very useful for learning__

<br>
(this should probably be two courses, and maybe it will eventually be)
{:.fragment}

</section>

<section markdown="block">
## That Sounds Pretty Harsh/Boring

__If you're concerned about the workload and the material...__ &rarr;

* {:.fragment} I'm __always available to help__, especially on piazza...as well as office hours and by appointment
* {:.fragment} We'll also have a tutor (I'll post a schedule by next week)

<br>
__If you think it's going too slowly...__ (you're one of those professionals that are taking this class for some reason 🤓) &rarr;

* {:.fragment} challenge yourself: if the assignment is to make a simple game...
* {:.fragment}  __make your own library/framework__ (like your own version of immutable.js or rxjs) from scratch, and use it to write the game
* {:.fragment} or... __add features__ to make the game _more complete_ - like... adding an undo move feature
* {:.fragment} or... add support tooling like unit tests, linters, and other build tools
* {:.fragment} or... _actually_ deploy your projects

</section>

<section markdown="block">
## Additional Course Info

* __Office Hours:__ {{ site.vars.office_hours }}
* __Office Hours Room:__  {{ site.vars.office_hours_room }}
* __Readings:__ [pulled from multiple free online books and documentation](/syllabus.html#books)
* __Grading:__ [weights for homework, exams, etc.](/syllabus.html#grading)
</section>


<section markdown="block">
## Required Software

### Node.js (obvs)

1. Suggested install - use the package manager on your OS
	* __OSX__ 
		* [install](https://github.com/Homebrew/homebrew/wiki/Installation) [homebrew](http://brew.sh/) 
		* <pre><code data-trim contenteditable>brew install node</code></pre>
	* __Linux__ (Specifically Debian/Ubuntu)
		* <pre><code data-trim contenteditable>sudo apt-get install nodejs
sudo apt-get install npm</code></pre>
2. Use the Node.js installer:
	* __Windows__, __OSX__, and __Linux__: see the [downloads page on the Node.js site](http://nodejs.org/) 
</section>

<section markdown="block">
## This Site, These Slides

* you can find my courses at [http://cs.nyu.edu/~jversoza/](http://cs.nyu.edu/~jversoza/)
* these slides were built with [reveal.js](http://revealjs.com/) for HTML/CSS slides
	* use arrow keys to navigate
	* (or click on arrow buttons)
* add a <code>?print-pdf</code> to the end of the slide deck's url to see the [one page version of the slides](intro.html?print-pdf)
</section>

<section markdown="block" data-background="#440000">
## If You Got Anything Out of These Slides

This &#128071;

* You're going to be writing __a lot of JavaScript__ (be prepared for weekly assignments)
* __I'm available for help__! The best way to get in touch with me is piazza or in-person (ask the question in class - someone else probably has the same question or office hours / appointment)
* __the 2nd exam is on the last day of class, NOT DURING FINALS WEEK__
* If you're a __graduating senior__, make sure you do the work; I can't just hand out C's (also, are you _really_ just trying to get a C?)!
* __Write your own code for assignments!__
* Do the readings / quizzes


</section>
