---
layout: slides
title: "Making Web Requests, Using APIs"
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.course_number}}-{{ site.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Web Review

* web review
    * http: client, server
    * http request: GET/POST
    * http response: statu
    * url: domain, path
* retrieving a web page
    * urllib
    * requests
* reading module documentation
    * requests
* getting data from a page
    * beautiful soup
    * scrap.py
* reading api documentation
    * tumblr api
    * nytimes api

</section>

<section markdown="block">
## APIs

__API__  stands for __Application Programmer Interface__: basically a set of tools that help you develop an application.

In the context of the web, some sites offer an __API__ to access their data. For example &rarr;

* [tumblr api](https://www.tumblr.com/docs/en/api/v2)
* [nytimes api](https://developer.nytimes.com/)
{:.fragment}

Note that apis usually require some sort of authentication, and that authentication can be as a simple as a unique key assigned to your program
{:.fragment}

</section>

<section markdown="block">
## Using APIs

__The general steps for using an API are__ &rarr;

1. {:.fragment} read documentation
2. {:.fragment} determine authorization (usually request a token)
3. {:.fragment} make an http request to the appropriate url to retrieve data
4. {:.fragment} parse the data (usually json, but you'll also see xml... and even plain html!)

__Let's see an example (you'll remember this, I think!)__
{:.fragment}
</section>

<section markdown="block">
## Ah. First Class!

<pre><code data-trim contenteditable>
import urllib.request, json

# we're going to ask tumblr for some posts ...
search_tag = 'cat'
api_key = 'TODO: fill me in!'
post_type = 'text'
url = 'http://api.tumblr.com/v2/tagged?api_key=' + api_key 
url = url + '&tag=' + search_tag

response = urllib.request.urlopen(url).read().decode('utf-8')
posts  = json.loads(response)['response']

for post in posts:
    if post['type'] == 'photo':
        tags = post['tags']
        photo = post['photos'][0]
        number_of_tags = len(tags)
        if number_of_tags > 2:
            print(tags)
            print(photo['original_size']['url'] + "\n\n")

</code></pre>

</section>

<section markdown="block">
## Simple NYT Search

<pre><code data-trim contenteditable>
import requests
import json
res = requests.get('https://api.nytimes.com/svc/search/v2/articlesearch.json?q=TODO&api-key=TODO');

data = json.loads(res.text)
docs = data['response']['docs']
for doc in docs:
    print(doc['headline']['main'])
    print(docs[0].keys())
    print(len(docs))
</code></pre>

</section>
