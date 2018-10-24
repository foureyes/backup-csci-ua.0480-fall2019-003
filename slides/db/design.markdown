---
layout: slides
title: "Database Design"
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Steps for Writing Software?

__So... u want to write an _awesome_ app..__ &rarr;

What are the high level steps for writing a program (_do you just start coding_)?
{:.fragment}

1. {:.fragment} requirements
2. {:.fragment} implementation
3. {:.fragment} testing
4. {:.fragment} bug fixing, refactoring (go back to 2 or even 1)

(Regardless of software development methodology you use, you'll end up using some variant of the above)
{:.fragment}

</section>

<section markdown="block">
## Makin' a Database

__As with software engineering, you don't want to just jump in and start creating tables haphazardly...__ &rarr;

The database design process may look something like:
{:.fragment}

1. {:.fragment} requirements analysis - specify the problem, work with _domain experts_, explore existing data, etc. ... to: 
	* {:.fragment} determine what data needs to be stored 
	* {:.fragment} how the data is related to each other?
2. {:.fragment} conceptual design
	* {:.fragment} use requirements to formally describe the data, relationships and constraints
	* {:.fragment} says nothing about _actual_ implementation (no details on  platform, physical storage, etc.)	
3. {:.fragment} translate conceptual design to actual _objects_ in specific DBMS / db platform

</section>

<section markdown="block">
## 

</section>
