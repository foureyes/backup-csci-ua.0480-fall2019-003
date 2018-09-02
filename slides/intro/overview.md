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

__Basically__ ...  you'll be <span class="hl">building end-to-end data pipelines with various tools.</span>

<aside class="notes">
* Who already knows js?
* Describe - type system, tools for abstraction... like inheritance,
</aside>
</section>

<section markdown="block">

## Server Side Programming Topics

<div markdown="block" class="img">
(specific technologies in __bold__)
</div>

* {:.fragment} Server Side Framework/Language - __Node.js__
* {:.fragment} HTTP
* {:.fragment} Web Framework - __Express__
* {:.fragment} Authentication and Session Management
* {:.fragment} Storing Data and Using a Database Abstraction Layer - __MongoDB__ and __Mongoose__ respectively
* {:.fragment} Forms
* {:.fragment} Building and Consuming APIs
* {:.fragment} Deployment

<aside class="notes">
* Request Methods / Response Codes?
* has anyone use NoSQL data stores?
* what about traditional databases? Postgres? MySQL?
* some [comparisons](https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems)
* Hooooowzzzz about JSON?
</aside>

</section>

<section markdown="block">
## Client Side Topics

<div markdown="block" class="img">
(specific technologies in __bold__)
</div>

Build-Out
{:.fragment}

* {:.fragment} Quick Review - __DOM/HTML5/CSS3__
* {:.fragment} CSS Layout
* {:.fragment} Using JavaScript to Manipulate Styles
* {:.fragment} Maybe Flexbox, Grids or SASS

<br>

Programming
{:.fragment}

* {:.fragment} DOM Manipulation - __Plain JavaScript, ES5/ES6__ (we're not using JQuery)
* {:.fragment} AJAX 
* {:.fragment} JavaScript Framework - __React__  or __vue.js__

<aside class="notes">
* know html? 
* know css?
* who's built a mobile ready site? what are some considerations when going from desktop to tablet or phone? think interaction design?
	* perhaps touch vs click/hover
	* resolution, obvs
	* performance / size
* anyone ever use JQuery
* what about backbone or angular?
</aside>
</section>

<section markdown="block">
## Development Tools Topics


<div markdown="block" class="img">
(specific technologies in __bold__)
</div>

* {:.fragment} Version Control - __Git__
* {:.fragment} Linter - __ESLint__
* {:.fragment} Unit Testing Tools
* {:.fragment} (Optionally) Debugger - __Node Debugger, Inspector__ and __Chrome Developer Tools__
* {:.fragment} (Maybe) Build Tools - __Grunt__, __Gulp__ ... or __webpack__?

<aside class="notes">
* what's version control? why?
* ever used git?
</aside>
</section>

<section markdown="block">
## Motivation for Technologies

__Why use JavaScript, Node.js and Express over Ruby and Ruby on Rails or Python and Django?__


1. {:.fragment} only __one language to learn__ throughout the course for server side development, front end development... and even database queries
2. {:.fragment} __straightforward to install__ entire stack (node, mongodb) on Windows, Linux and OSX
3. {:.fragment} seems like a __skill set that's currently sought after__ (former students are working with these technologies professionally!)
5. {:.fragment} a __fun__ stack to learn (really!)

<br> 
The concepts and theory remain the same across this and other _technology stacks_, so what you learn here is applicable to Ruby, Python, etc. too!
{:.fragment}
</section>

<section markdown="block">
## Me?

### Joe Versoza

* {:.fragment} I think I know some of you / you know me from 0002 or 0101 (uh-oh ... __why__ would you want take another _class_ with me?)!
* {:.fragment} __Clinical Assistant Professor__ (you can find me at: {{ site.vars.office_hours_room }})
* {:.fragment} Before teaching full time
	* {:.fragment} managed a bunch of programmers at a non profit
    * {:.fragment} (turns out, managing programmers is _not so fun_ &#128557; &#128514; &#128528;) 
    * {:.fragment} also worked as software engineer for a looong time - mostly with &#128013; ([web.py](http://webpy.org/) and [Django](https://www.djangoproject.com/), and even some [flask](http://flask.pocoo.org/)), but with some [Rails](http://rubyonrails.org/), [PHP](http://en.wikipedia.org/wiki/PHP), [Java/JSP](http://en.wikipedia.org/wiki/JavaServer_Pages) too...

<aside class="notes">
Why would you ever take another class with me?
Really love teaching. Left great full time job management/programming job to teach!
FYI, also - for coders - management is difficult, but it's a legit career track
</aside>
</section>

<section markdown="block">
## About... You

__I expect (hope?) that you__:

1. {:.fragment} are very __comfortable__ using the __commandline__
2. {:.fragment} have the ability to install tools, software, etc. ... and troubleshoot installations (<strong>basically _know how to use a computer_ </strong>)
3. {:.fragment} are able __navigate__ through your __file system__ (both through a file explorer like Finder and through the commandline)
4. {:.fragment} have basic/rudimentary knowledge of __HTML__ and __CSS__ (even a [late 90's notion](https://www.google.com/search?q=90%27s+website&espv=2&tbm=isch&tbo=u&source=univ&sa=X&ei=wegEVMjPJcPxgwTA5YDICg&ved=0CCgQsAQ&biw=1307&bih=729) of how this stuff works _may be_ fine)
5. {:.fragment} <strong>_actually do homework and - you know - occasionally come to class_</strong> 
6. {:.fragment} (low bar, I know... but I mean it)

<br>
Also, a big (non-) expectation: 
{:.fragment}

Only __minimal experience with__ __JavaScript__, __server-side web development__, and _modern_ __front-end development__
{:.fragment}

</section>

<section markdown="block">

## If You Already Know This Stuff

For example...

* {:.fragment} if __you do this professionally__ (seriously, I've had people who get paid to do this take this class???  &#129300;)
* {:.fragment} or... if __you've already taken several web minor courses__, including web programming and databases

<br> 
__What are you doing here? GET OUT!__ &#128073;
{:.fragment}

* {:.fragment} Really, though, you probably won't get much out of the class 
* {:.fragment} And you'll slack off a bit 
* {:.fragment} <small markdown="block" style="display:inline">(And then get like a B+, and then you'll try to argue with me about your grade, and I'll be like _I told you not to take this class_, and then we'll both be sad. The end.)</small>

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
