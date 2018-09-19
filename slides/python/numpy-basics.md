---
layout: slides
title: "NumPy Operators, Slicing"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.course_number}}-{{ site.course_section }}

<p><small></small></p>
</section>

<section markdown="block">

## Array Arithmetic / Vectorization

__Arithmetic operations behave differently based on the type of the _other_ operand. For example.__

If the other operand is a scalar (_single value types_ like `int`, `float`, `boolean`, `string`, etc.), then the operation is performed on every element using the same scalar as the second operand:

<pre><code data-trim contenteditable>
arr = np.array([[1, 2, 3], [4, 5, 6]])
print(arr * 10)
</code></pre>

<pre><code data-trim contenteditable>
[[10 20 30]
 [40 50 60]]
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## Arithmetic Continued

<pre><code data-trim contenteditable>
arr = np.array([[1, 2, 3], [4, 5, 6]])
arr + arr
</code></pre>

<pre><code data-trim contenteditable>
array([[ 2,  4,  6],
       [ 8, 10, 12]])
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
arr + np.array([1, 2, 3])
array([[2, 4, 6],
       [5, 7, 9]])
</code></pre>
{:.fragment}
</section>

<pre><code data-trim contenteditable>

</code></pre>
