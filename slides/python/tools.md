---
layout: slides
title: "Installation, Tools, Running Your Code"
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Using Python to Work with Data

The __first part of this semester__ will focus on:

1. {:.fragment} intermediate Python skillz
2. {:.fragment} using Python to:
	* {:.fragment} read / retrieve and clean data
	* {:.fragment} analyze and / or visualize data

All of this <span class="hl">without a database or SQL</span> (at least not yet!).
{:.fragment}

(we'll get to that in a month or so) 📅
{:.fragment}

Many <span class="hl">readings</span> for for this part of the semester will come from <span class="hl">{{site.vars.book2}}</span>
{:.fragment}
</section>

<section markdown="block">
## Why Python?

There are <span class="hl">so many languages for scientific / numeric computing and working with data</span>... &rarr;

* {:.fragment} [Julia](https://julialang.org/)
* {:.fragment} [R](https://www.r-project.org)
* {:.fragment} [MATLAB](https://www.mathworks.com/products/matlab.html)

__❓🐍 over these other languages?__
{:.fragment}
</section>

<section markdown="block">
## ❓🐍  Continued...

__We'll use Python and its ecosystem of data related modules because__ &rarr;

* {:.fragment} it's _really_ popular ([like top 3 popular](https://www.tiobe.com/tiobe-index/) 📈)
* {:.fragment} has a [thriving data science / engineering community](https://pydata.org/) 🤓🤓🤓
* {:.fragment} `pandas`, `jupyter-notebook`, etc. are pretty standard tools to use in your data stack 🐼
* {:.fragment} it's a general purpose language that's been widely adopted in other domains, like web applications, dev ops, etc.
* {:.fragment} you probably know basic python already (more time to focus on data related topics) 🔬
* {:.fragment} oh, and I actually _know_ Python a little bit; at least enough to teach it! 🙃


</section>

<section markdown="block">
## Setting up a Dev Environment

__When preparing your computer to develop with _some stack_ of technologies__, what will you need to install? &rarr;

* {:.fragment} a programming language
* {:.fragment} some libraries (in _that_ language)
* {:.fragment} other system level dependencies (that the language or libraries depend on)
* {:.fragment} an editor
* {:.fragment} _ideally_: 
	* {:.fragment} a <span class="hl">package manager </span>
	* {:.fragment} maybe even a <span class="hl">version manager for your language</span>
	* {:.fragment} some mechanism for <span class="hl">isolating installed packages and versions of your language</span>

PLZ EXPLAIN
{:.fragment}

</section>

<section markdown="block">
## Isolating Packages / Language Versions

__You'll probably want a way to make sure that you can create multiple isolated _environments_ to work in__ &rarr;

* {:.fragment} that is, a specific version of Python
* {:.fragment} some libraries / modules / packages
* {:.fragment} on a <span class="hl">per-application basis</span>

__Why ⁉️__
{:.fragment}

* {:.fragment} each <span class="hl">application may depend on a different </span> set / version of dependencies / actual language!
* {:.fragment} you may want to be able to update versions for some projects / applications, but not all!
</section>

<section markdown="block">
## A Python Development Environment

__There are many ways to set up a Python dev environment.__ &rarr;

* {:.fragment} you're free to do this <span class="hl">any way you like</span>
* {:.fragment} however, I'd recommend using [Anaconda](https://anaconda.org/) if this is your first experience with Python package / dependency management
* {:.fragment} some alternatives includes


</section>


<section markdown="block">
## 

</section>

<section markdown="block">
## Topics

* development environment concepts
	* os
	* dependencies
		* non-python libs / soft
			* ex xml parser
		* python libs
		* build tools for other dependencies
	* python path?
	* "redeployment"
		* reproducible install process
		* dependency management (manifest)
* installation python3
	* anaconda (distribution) # <-- prob do this!
	* homebrew
	* pyenv
	* pipenv
	* prob use conda
		* more than just Python packag management
		* also manages other
	* BUT other 
* isolated versions
	* conda
	* pipenv
* python and modules as files

</section>

<!--
* Package / Python Version Management
  * Pip
  * Pip-env
  * Virtualenv
  * Anaconda
* Static Analysis
  * Linter: PyFlakes / PEP...
  * Type Checking: MyPy?
* Interactive Shell
  * python
  * IPython
* Notebooks
  * Jupyter Notebook
  * Jupyter Lab
-->
