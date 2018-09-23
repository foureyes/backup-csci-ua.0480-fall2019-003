---
layout: slides
title: "Pandas Basics"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

</section>

<section markdown="block">
## numpy + ┬──┬ =🐼 

__Um... sort of. <span class="fragment"><span class="hl">pandas</span> is... &rarr;</span>__
{:.fragment} 

<span class="hl">pandas</span> a python module that has data structures and tools for working with data
{:.fragment} 

You'll find a lot of _numpy-like_ functionality in it: 
{:.fragment} 

* {:.fragment} especially for array based computing and functions 
* {:.fragment} and, of course, a style that __favors vectorized array operations over for loops__

However, unlike numpy, <span class="hl">pandas specializes in dealing with tabular data composed of mixed data types</span>
{:.fragment} 

</section>


<section markdown="block">
## Two Types!

__pandas offers two types for manipulation of tabular data:__ &rarr;

* {:.fragment} __Series__ 
	* {:.fragment} one-dimensional, labeled, array
* {:.fragment} __DataFrame__
	* {:.fragment} two-dimensional data structure (think of a table with columns and rows)

Let's check out a `Series` first!
{:.fragment}

</section>

<section markdown="block">
## Series

__You can think of a `Series` as: &rarr;__

* {:.fragment} a numpy `ndarray` with labels for each value
* {:.fragment} ... or a `dict` with ordered key/value pairs and potentially duplicate keys
* {:.fragment} ... but officially (from the docs):
	* {:.fragment} a one-dimensional labeled array 
	* {:.fragment} where the associated labels are collectively referred to as the <span class="hl">index</span>
</section>

<section markdown="block">
## `index` and `value` 

__A `Series` has two properties that show the labels and data it holds__ &rarr;

* {:.fragment} `values` - the _actual_ data in the `Series`
* {:.fragment} `index` - the labels for the data in `Series`

</section>

<section markdown="block">
## Creating a Series

__There are several ways to create a `Series`, each resulting in different labels for the index__ &rarr;

1. {:.fragment} using a single positional argument, `data` (an `ndarray` or sequence type like `list`), to specify `values` in `Series`
2. {:.fragment} two positional (`data` and `index`) arguments with the second specifying the `index` labels
3. {:.fragment} passing keyword arguments for `data` and `index`
4. {:.fragment} passing in a `dict` with dictionary keys as `labels` and values as `values`
	* {:.fragment} (can also be called with a specific `index` value)

Remember, the <span class="hl">index</span> provides a label for each element in a `Series`.
{:.fragment}
</section>

<section markdown="block">
## Implicit Index

__Without and `index` specified, the labels are simply 0 to length of `values` - 1. Check the examples__  &rarr;

<pre><code data-trim contenteditable>
# an ndarray
pd.Series(np.array([7, 8, 9]))
0    7
1    8
2    9
dtype: int64
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
# a list
pd.Series(['ant', 'bat', 'cat'])
0    ant
1    bat
2    cat
dtype: object
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## That Looks Like `numpy`! But!

Hey... this _actually_ looks just like an `ndarray`. __Note the `dtype` property!__

However, you'll see that there are a couple of major differences:
{:.fragment}

1. {:.fragment} the obvious difference is that it has `index` labels (that can be repeated)
2. {:.fragment} additionally, it supports different types in its `values`:
	 <pre class="fragment"><code data-trim contenteditable>
pd.Series(['ant', 'bat', 123])
0    ant
1    bat
2    123
dtype: object
</code></pre>
</section>

<section markdown="block">
## Specifying Labels 🏷 

So, um... if `index` labels are just _gonna_ be 0 through length, then that's just the same as an `ndarray`, right? __Let's specify labels by adding a second positional argument__ &rarr;

<pre><code data-trim contenteditable>
pd.Series(['Hoboken', 'Ithaca'], ['NJ', 'NY'])
NJ    Hoboken
NY     Ithaca
</code></pre>
{:.fragment}

Oh yes. Duplicate. Labels. R. Allowed. 👯
{:.fragment}

<pre><code data-trim contenteditable>
pd.Series(['Syracuse', 'Hoboken', 'Ithaca'], 
    ['NY', 'NJ', 'NY']) # (line continuation)
NY    Syracuse
NJ     Hoboken
NY      Ithaca
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## With 🔑 Arguments

__You can also pass these arguments in as keyword arguments `data` and `index` (for labels)__ &rarr;


<pre><code data-trim contenteditable>
pd.Series(data=[7, 8])
0    7
1    8
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
pd.Series(data=[7, 8], index=['A', 'B'])
A    7
B    8
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
pd.Series([7, 8, 9], index=['A', 'B', 'C'])
A    7
B    8
C    9
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## `len(data) == len(index)`

__The lengths of the `data` and `index` passed in must be the same.__

If these lengths are different, you'll get a `ValueError`: 
{:.fragment}

<pre><code data-trim contenteditable>
pd.Series([7, 8, 9], index=['A', 'B'])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>ValueError: Length of passed values is 3, index implies 2
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## Creating `Series` with `dict` 📖

__Earlier, we described a `Series` as a dictionary that allows duplicate labels.__ 

In fact you can pass a `dict` in to a `Series` constructor:
{:.fragment}

<pre><code data-trim contenteditable>
pd.Series({'B': 'bat', 'A': 'ant'})
B    bat
A    ant
</code></pre>
{:.fragment}

* {:.fragment} `dict` keys become labels
* {:.fragment} `dict` values are the values in the `Series`

</section>

<section markdown="block">
## `dict` with `index`

<pre><code data-trim contenteditable>
pd.Series({'A': 'ant', 'B': 'bat'}, ['A', 'B']) # OK
A    ant
B    bat
</code></pre>
{:.fragment}

If a key from `data` doesn't match an element in `index`, <span class="hl">it's value is not included.</span>
{:.fragment}

<pre><code data-trim contenteditable>
pd.Series({'A': 'ant', 'B': 'bat'}, ['A'])
A    ant
</code></pre>
{:.fragment}

If an `index` label does not have a corresponding key in `data`, <span class="hl">then missing `data` values will be `NaN`</span>
{:.fragment}

<pre><code data-trim contenteditable>
pd.Series({'A': 'ant', 'B': 'bat'}, ['A', 'C'])
A    ant
C    NaN
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## `NaN` Means Missing Data

__In pandas, `NaN` implies that a value is missing or "N/A"__ &rarr;

The `pandas` functions / instance methods, `isnull` and `notnull` can be used to check for missing values:

<pre><code data-trim contenteditable>
s = pd.Series({'x': 100}, ['x', 'y'])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
pd.isnull(s) # or s.isnull()
x    False
y     True
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
pd.notnull(s) # or s.notnull()
x     True
y    False
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## `index` and `value` Revisited

__The `index` and `values` properties of a `Series` object can be used to retrieve the labels and data from a `Series`__

(note that this is slightly confusing as the keyword arg is called `data`, while the property is called `values`)
{:.fragment}

<pre><code data-trim contenteditable>
 s = pd.Series([7, 8, 9], ['x', 'y', 'z'])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
s.values
array([7, 8, 9])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
s.index
Index(['x', 'y', 'z'], dtype='object')
</code></pre>
{:.fragment}

</section>


<section markdown="block">
## Indexing

__Indexing a `Series` is similar to indexing a 1-dimensional `ndarray`__

<pre><code data-trim contenteditable>
s = pd.Series([7, 8, 9, 10], list('xyxz'))
s['y'] # 8 ... (as expected)
</code></pre>
{:.fragment}

Using a `list` to specify multiple labels:
{:.fragment}

<pre><code data-trim contenteditable>
s[['y', 'z']] #  Series! y     8
              #          z    10
</code></pre>
{:.fragment}

Repeating a label repeats value:
{:.fragment}

<pre><code data-trim contenteditable>
s[['y', 'y', 'z']] #  Series  y     8
                   #          y     8
                   #          z    10
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Duplicate Labels 🔖👯

__If a label specified maps to more than one value, give back all values__ &rarr;

<pre><code data-trim contenteditable>
s = pd.Series([7, 8, 9, 10], list('xyxz'))
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
s['x'] #  Series! x     7
       #          x     9
</code></pre>
{:.fragment}
</section>


<section markdown="block">
## `Series` Operations

`Series` operations align by label rather than position:  &rarr;

* {:.fragment} if index pairs aren't the same (present in one, missing from the other), then <span class="hl">resulting `index`</span> will be both labels!
* {:.fragment} missing values are inserted where labels to not match 

__What is the result of the following operation?__ &rarr;
{:.fragment}

<pre><code data-trim contenteditable>
s1 = pd.Series([1, 2], ['x', 'y'])
s2 = pd.Series([9, 100], ['x', 'z'])

s1 + s2
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
x    10.0
y     NaN
z     NaN
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Vectorized Arithmetic

Yup ✅ ... works as you'd expect:

<pre><code data-trim contenteditable>
s = pd.Series([1, 2], ['x', 'y'])
</code></pre>
{:.fragment}


<pre><code data-trim contenteditable>
s - 2
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
x   -1
y    0
</code></pre>
{:.fragment}

</section>


<section markdown="block">
## DataFrames 🖼  

__You can think of a <span class="hl">DataFrame</span> as:__ &rarr;

* {:.fragment} a rectangular table of data
* {:.fragment} or an ordered collection of columns
	* {:.fragment} (where perhaps each column is a `Series`!)
	* {:.fragment} (think a `dict` of `Series` objects!)

</section>
<section markdown="block">
## `index` and `columns`

__In a `DataFrame`, both rows and columns have an `index`. The nomenclature is:__

* {:.fragment} `index` - for row labels
* {:.fragment} `columns` - for column labels
* {:.fragment} `data` - again, the actual values is called `data`

`data`, `index` and `columns` can be specified when creating a new `DataFrame`
{:.fragment}
</section>

<section markdown="block">
## Creating DataFrames

__Like `Series`, there are multiple ways to create `DataFrames`__ &rarr;

* {:.fragment} positional arguments
	* {:.fragment} with an`ndarray` or other sequence types
	* {:.fragment} with a `dict`
* {:.fragment} using keyword arguments
* {:.fragment} mixing positional and keyword arguments

Each method allows different ways to specify `data`, `index` and `columns`
{:.fragment}

</section>

<section markdown="block">
## Implicit `index` and `columns`

__Without the second or third arguments specified, `index` and `columns` are generated as 0 to length of rows or cols - 1__

<pre><code data-trim contenteditable>
# only data (index and columns generated)
pd.DataFrame([[1, 2, 3], [4, 5, 6]])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
   0  1  2
0  1  2  3
1  4  5  6
</code></pre>
{:.fragment}


<pre><code data-trim contenteditable>
# only data and index (columns generated)
pd.DataFrame([[1, 2, 3], [4, 5, 6]], ['r1', 'r2'])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
    0  1  2
r1  1  2  3
r2  4  5  6
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Creating DataFrames Continued

__Of course, with all three, you can explictly set `data`, `index`, and `columns`__ &rarr;

<pre><code data-trim contenteditable>
pd.DataFrame(
    [[1, 2, 3], [4, 5, 6], [7, 8, 9 ], # data
    ['r1', 'r2', 'r3'],                # index
    ['A', 'B', 'C'])                   # columns
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
    A  B  C
r1  1  2  3
r2  4  5  6
r3  7  8  9
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## Keyword Arguments

__Like `Series`, you can mix and match with keyword arguments:__ &rarr;

In the following code, notice that:
{:.fragment}

* {:.fragment} `data` is passed in as a positional argument,
* {:.fragment} `index` is left out (to be generated automatically)
* {:.fragment} `columns` is defined as a keyword argument

<pre><code data-trim contenteditable>
pd.DataFrame([[1, 2, 3], [4, 5, 6]], 
    columns=['A', 'B', 'C'])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
   A  B  C
0  1  2  3
1  4  5  6
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Retrieving Columns

__Columns can be retrieved by:__

* {:.fragment} indexing with a <span class="hl">single column name</span> 
	* {:.fragment} (which may return a `Series` or `DataFrame`)
* {:.fragment} indexing with a <span class="hl">list</span> of column names to return a `DataFrame`

__Using the following `DataFrame`, let's check out some indexing possibilities__ &rarr;
{:.fragment}

<pre><code data-trim contenteditable>
pd.DataFrame([[4, 5, 6], [7, 8, 9]],
    columns=['foo', 'bar', 'baz'])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
   foo  bar  baz
0    4    5    6
1    7    8    9
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## Retrieving one Column

__With a single column name, a column is returned as a `Series`__ &rarr; 

<pre><code data-trim contenteditable>
df['foo']
0    4
1    7
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
# note that the type and name of the column are usually
# given too:
Name: foo, dtype: int64
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
type(df['foo']) # we get a series back
pandas.core.series.Series
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
df['foo'].name # note the name attribute!
Out[107]: 'foo'
</code></pre>
{:.fragment}



</section>


<section markdown="block">
## Retrieving Multiple Columns pt 1!

__If a label in the `index` occurs more than once, then a `DataFrame` of multiple columns is returned rather than a single `Series`__ &rarr;


<pre><code data-trim contenteditable>
d = pd.DataFrame([[4, 5, 6], [7, 8, 9]],
    columns=['a', 'b', 'a'])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
d['a']
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
   a  a
0  4  6
1  7  9
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## Retrieving Multiple Columns pt 2!

__When indexing with a list of column names (even if there's only one name in the list), a `DataFrame` is returned with only the columns matching the names in the list included in the returned `DataFrame`__ &rarr;
{:.fragment}

<pre><code data-trim contenteditable>
df[['foo', 'bar']]
   foo  bar
0    4    5
1    7    8
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
type(df[['foo', 'bar']])
pandas.core.frame.DataFrame
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
type(df[['foo']])  # list w/ 1 element
pandas.core.frame.DataFrame # (still!)
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Reorganize / Repeat

__Indexing can also be used to reorder columns and repeat columns__ &rarr;

Given the `DataFrame` we've been working with:
{:.fragment}

<pre><code data-trim contenteditable>
pd.DataFrame([[4, 5, 6], [7, 8, 9]],
    columns=['foo', 'bar', 'baz'])
</code></pre>
{:.fragment}

__What `DataFrame` will we get back from:__ &rarr;
{:.fragment}

<pre><code data-trim contenteditable>
df[['bar', 'bar', 'foo']]
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
   bar  bar  foo  # bar is repeated
0    5    5    4  # and placed before
1    8    8    7  # foo
</code></pre>
{:.fragment}

</section>


<section markdown="block">
## If Key Doesn't Exist...

__Regardless of whether or not a list or a single column is used for indexing into a `DataFrame`, a `KeyError` is raised if a key doesn't exist__ &rarr;


<pre><code data-trim contenteditable>
df[['foo', 'dne']]
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
KeyError: "['dne'] not in index"
</code></pre>
{:.fragment}



</section>
