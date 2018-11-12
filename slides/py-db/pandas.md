---
layout: slides
title: "Joins, Merging, Group By, Database"
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Hierarchical Indexing

With a feature called __Hierarchical Indexing__, pandas allows `DataFrames` and `Series` to have __multiple "nested" indexes__. Hierarchical Indexing is useful for:

* {:.fragment} grouping and reshaping algorithms
* {:.fragment} working with higher-dimensional data in a lower dimensional form
* {:.fragment} instead of a regular `Index` object representing a `DataFrame` or `Series` index, a Hierarchical Index is represented by a `MultiIndex` object

We won't go in-depth with `MultiIndex`; we'll just look at enough to do some basic _SQL-like_ grouping and reshaping
{:.fragment}

</section>
<section markdown="block">
## MultiIndex Example

__A quick way to create a `MultiIndex` is to use a multidimensional list as the `index`__ &rarr;
<pre><code data-trim contenteditable>
s = pd.Series(np.arange(9), 
	index=[list('aabbbcaaa'), [9, 8, 8, 7, 6, 5, 8, 1, 2]])
</code></pre>
{:.fragment}


<pre><code data-trim contenteditable>
a  3    0
   3    1
b  3    2
   2    3
   1    4
c  2    5
a  2    6
   1    7
   1    8
dtype: int64
</code></pre>
{:.fragment}



</section>

<section markdown="block">
## 

</section>
