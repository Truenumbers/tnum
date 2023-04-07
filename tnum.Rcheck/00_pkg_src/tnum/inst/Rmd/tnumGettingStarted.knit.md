
<!-- rnb-text-begin -->

---
title: "Getting Started wth **tnum** for R"
author: "[True Engineering Technology, LLC](http://truenum.com) Boston MA" 
output: html_notebook
---

***

### 

***tnum* is a data management companion for R.**  In using R, we draw from a variety of data sources, reading them into tables, vectors or lists for exploration and analytic processing.  This in turn produces more data, from summary statistics and models to graphs and tables that enrich the original data, or derive new information from it. Doing this results in many different data structures, labeled with informal row and column names, and many files persisting data on disk. Working and collaborating with these requires keeping track of all their meaning, structure and file versions. 

**Truenumbers**, is a central cloud repository for creating, tagging and querying persistent data as a collection of facts using a structured pseudo-natural language to describe them. We call these facts *truenumbers*, *tnums* or *TNs*.  TNs mesh well with the way R allows descriptive attributes to be attached to data values.  Like TN, R also recognizes the value of carrying descriptive informaton along with data values.  Using *tnum* provides a convenient and scalable way to manage data and results as a growing body of intelligible knowledge, without resorting to relational databases (which are usually far from intelligible).  


### Getting up and running

After installing package *tnum*, it's necessary to authenticate with the *tnum* server:

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubGlicmFyeSh0bnVtKVxudG51bS5hdXRob3JpemUoKVxuYGBgIn0= -->

```r
library(tnum)
tnum.authorize()
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiQXZhaWxhYmxlIHNwYWNlczogdGVzdHNwYWNlLCBNRVBFRCwgYWxpb24tcmYsIHNoYXJlZC10ZXN0c3BhY2UsIE1TU1AtMSwgd2ludGVyZ3JlZW4sIHRlc3RzcGFjZSwgdGVzdHNwYWNlLCB0ZXN0c3BhY2UsIHRlc3RzcGFjZSwgdGVzdHNwYWNlLCB0ZXN0c3BhY2UsIHRlc3RzcGFjZSwgdGVzdHNwYWNlLCB0ZXN0c3BhY2UsIHRlc3RzcGFjZSwgdGVzdHNwYWNlLCB0ZXN0c3BhY2UsIHRlc3RzcGFjZSwgdGVzdHNwYWNlLCB0ZXN0c3BhY2UsIHRlc3RzcGFjZSwgdGVzdHNwYWNlLCB0ZXN0c3BhY2UsIHRlc3RzcGFjZSwgdGVzdHNwYWNlLCBzaGFyZWQtdGVzdHNwc2FjZSwgaGFyZWQtdGVzdHNwYWNlXG5OdW1iZXJzcGFjZSBzZXQgdG86IHNoYXJlZC10ZXN0c3BhY2VcbiJ9 -->

```
Available spaces: testspace, MEPED, alion-rf, shared-testspace, MSSP-1, wintergreen, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, testspace, shared-testspsace, hared-testspace
Numberspace set to: shared-testspace
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

*authorize* can also take an argument **ip** representing the URL or IP address of the *tnum* server endpoint.  The default will be the endpoint for your particular installation. The function displays a list of available numberspaces on the server. A *numberspace* is a separate repository for truenumber data.  The authorize() call sets the current numberspace to a numberspace defined by your administrator.    

### Truenumber facts and phrases

A truenumber fact (a *tnum*) is equivalent to a sentence of the form **&lt;subject&gt; has &lt;property&gt; = &lt;value&gt;**, or **&lt;property&gt; of &lt;subject&gt; is &lt;value&gt;** for example:

<br>
<center>
**number of fulltime undergraduate students of colorado state university is 15646**
</center>
<br>
and
<br>
<center>
**montclair state university has graduation rate = 58%**
</center>
<br>
The subject  **fulltime undergraduate students of montclair state university ** is equivalent to a path **university:state:montclair/students:undergraduate:fulltime** where the separator **:** denotes an *adjective* relationship, and **/** denotes a possesive.

Let's make truenum objects for them:


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuIyBjcmVhdGUgYSBsaXN0IG9mIHR3byBvYmplY3RzIGFuZCBkaXNwbGF5IG9uZSBvZiB0aGVtIFxudG4gPC0gbGlzdCgpXG5cbnRuW1sxXV0gPC0gdG51bS5tYWtlT2JqZWN0KFxuICBzdWJqZWN0ID0gXCJ1bml2ZXJzaXR5OnN0YXRlOmNvbG9yYWRvL3N0dWRlbnRzOnVuZGVyZ3JhZHVhdGU6ZnVsbHRpbWVcIixcbiAgcHJvcGVydHkgPSBcIm51bWJlclwiLFxuICB2YWx1ZSA9IDE1NjQ2XG4pXG5cbnRuW1syXV0gPC0gdG51bS5tYWtlT2JqZWN0KFxuICBzdWJqZWN0ID0gXCJ1bml2ZXJzaXR5OnN0YXRlOm1vbnRjbGFpclwiLFxuICBwcm9wZXJ0eSA9IFwicmF0ZTpncmFkdWF0aW9uXCIsXG4gIHZhbHVlID0gNTgsXG4gIHVuaXQgPSBcIiVcIlxuKVxuXG50blxuYGBgIn0= -->

```r
# create a list of two objects and display one of them 
tn <- list()

tn[[1]] <- tnum.makeObject(
  subject = "university:state:colorado/students:undergraduate:fulltime",
  property = "number",
  value = 15646
)

tn[[2]] <- tnum.makeObject(
  subject = "university:state:montclair",
  property = "rate:graduation",
  value = 58,
  unit = "%"
)

tn
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiW1sxXV1cblsxXSAxNTY0NlxuYXR0cigsXCJjbGFzc1wiKVxuWzFdIFwidG51bVwiXG5hdHRyKCxcInN1YmplY3RcIilcblsxXSBcInVuaXZlcnNpdHk6c3RhdGU6Y29sb3JhZG8vc3R1ZGVudHM6dW5kZXJncmFkdWF0ZTpmdWxsdGltZVwiXG5hdHRyKCxcInByb3BlcnR5XCIpXG5bMV0gXCJudW1iZXJcIlxuYXR0cigsXCJkYXRlXCIpXG5bMV0gXCJXZWQgTm92IDE4IDIzOjQwOjE0IDIwMjBcIlxuXG5bWzJdXVxuWzFdIDU4XG5hdHRyKCxcInVuaXRcIilcblsxXSBcIiVcIlxuYXR0cigsXCJjbGFzc1wiKVxuWzFdIFwidG51bVwiXG5hdHRyKCxcInN1YmplY3RcIilcblsxXSBcInVuaXZlcnNpdHk6c3RhdGU6bW9udGNsYWlyXCJcbmF0dHIoLFwicHJvcGVydHlcIilcblsxXSBcInJhdGU6Z3JhZHVhdGlvblwiXG5hdHRyKCxcImRhdGVcIilcblsxXSBcIldlZCBOb3YgMTggMjM6NDA6MTQgMjAyMFwiXG4ifQ== -->

```
[[1]]
[1] 15646
attr(,"class")
[1] "tnum"
attr(,"subject")
[1] "university:state:colorado/students:undergraduate:fulltime"
attr(,"property")
[1] "number"
attr(,"date")
[1] "Wed Nov 18 23:40:14 2020"

[[2]]
[1] 58
attr(,"unit")
[1] "%"
attr(,"class")
[1] "tnum"
attr(,"subject")
[1] "university:state:montclair"
attr(,"property")
[1] "rate:graduation"
attr(,"date")
[1] "Wed Nov 18 23:40:14 2020"
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

*tnum* provides a function to convert a list of tnum objects to a data.frame:

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGYgPC0gdG51bS5vYmplY3RzVG9EZih0bilcbmRmXG5gYGAifQ== -->

```r
df <- tnum.objectsToDf(tn)
df
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbImRhdGEuZnJhbWUiXSwibnJvdyI6MiwibmNvbCI6OX0sInJkZiI6Ikg0c0lBQUFBQUFBQUJvVlR6VTdDUUJCZUNnVnBCRTI4R0U5Y1BGS2hZS0k5a2VoVlk3eklkV21YdWxwMnlmNmdudlFOZkFjZnlHZnhDZEJaMkVVb2lUWnBaK2JiK2YxbWUzczU3QVhEQUNGVVJoWGtvYklQS3FwZTNIU2owd2loaWdkV0NVN3FSajZEMXdFb3h0aUgxN01INTVyUkdSR1NxcGRZS3F4SW5QQ2NDNXp5RTZsMFNwaVNzV1lwRVJsZzJweVBkWjRyT2lFMndkRldnZ2xuS3NreEZZVlNWYVluSXlLc3RTZU1yODFLT1ZzNVE0L2Y4S3pKcHNFSG4rOW1QRFM0UXU1WjRLOWZScTE5T0xtVnh4SncvRWVCOVM0UDcwamF1dWF6VnZlc0ZmWGlmaWZ1OWx0UkorcjhlNDZRMllYM0JwKzNSWDhiRy9BWm5oQnBpOVV0V0pONjlFQVNaYzJkcWVCVEl0U0x0WGVsRXBSbDRRem4ydkhkQUJhSm9Na0c2Qk1odUdPMkFodHhHU3NLWjlMcEtURHU5RXpUdE5CaFhmQ24wSFhac0ZTVmxuSnpGTml1ZEtNNE1JRHNPQndMaUFkclhnaXA4YWxaTWdSNTVoYjZoZUNTS0FCN21wbE8wblp5cjlsanUyZkpMZG5OTjM0N1crbjFaVW5QTGRSMzE0NndqTElWVXprZWtkd2FUWmg0TVhBNEJaNGRad0dnTWxSY1llY1h3RC9oa01Wc2FQNERGdlQ3Q0gwREFBQT0ifQ== -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["subject"],"name":[1],"type":["chr"],"align":["left"]},{"label":["property"],"name":[2],"type":["chr"],"align":["left"]},{"label":["string.value"],"name":[3],"type":["chr"],"align":["left"]},{"label":["numeric.value"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["error"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["unit"],"name":[6],"type":["chr"],"align":["left"]},{"label":["tags"],"name":[7],"type":["chr"],"align":["left"]},{"label":["date"],"name":[8],"type":["chr"],"align":["left"]},{"label":["guid"],"name":[9],"type":["lgl"],"align":["right"]}],"data":[{"1":"university:state:colorado/students:undergraduate:fulltime","2":"number","3":"NA","4":"15646","5":"NA","6":"NA","7":"NA","8":"Wed Nov 18 23:40:14 2020","9":"NA"},{"1":"university:state:montclair","2":"rate:graduation","3":"NA","4":"58","5":"NA","6":"%","7":"NA","8":"Wed Nov 18 23:40:14 2020","9":"NA"}],"options":{"columns":{"min":{},"max":[10],"total":[9]},"rows":{"min":[10],"max":[10],"total":[2]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuTkFcbmBgYCJ9 -->

```r
NA
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


Next, we post the object list to the server, then query the server for these tnums by subject path starting with *university#* , allowing any property, by using path and string wildcards **#** and **\***:

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmVzdWx0IDwtIHRudW0ucG9zdE9iamVjdHModG4pXG5gYGAifQ== -->

```r
result <- tnum.postObjects(tn)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiUG9zdGluZyAyMTEgY2hhcmFjdGVyc1xucG9zdGVkIDIgdG51bXNcbiJ9 -->

```
Posting 211 characters
posted 2 tnums
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuIyBSdW4gcXVlcnkgYW5kIGNvbnZlcnQgdG51bXMgdG8gcm93cyBvZiBhIGRhdGEuZnJhbWVcblxucmV0dXJuZWQub2JqZWN0cyA8LSB0bnVtLnF1ZXJ5KFwidW5pdmVyc2l0eSMgaGFzICpcIilcbmBgYCJ9 -->

```r
# Run query and convert tnums to rows of a data.frame

returned.objects <- tnum.query("university# has *")
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiUmV0dXJuZWQgMSB0aHJ1IDIgb2YgMiByZXN1bHRzXG4ifQ== -->

```
Returned 1 thru 2 of 2 results
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmV0dXJuZWQub2JqZWN0cy5mcmFtZSA8LSB0bnVtLm9iamVjdHNUb0RmKHJldHVybmVkLm9iamVjdHMpXG5yZXR1cm5lZC5vYmplY3RzLmZyYW1lXG5gYGAifQ== -->

```r
returned.objects.frame <- tnum.objectsToDf(returned.objects)
returned.objects.frame
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjpbImRhdGEuZnJhbWUiXSwibnJvdyI6MiwibmNvbCI6OX0sInJkZiI6Ikg0c0lBQUFBQUFBQUJtVlR6VzdVTUJEMlpwTXVHOUVXaVJzbkRzRE5JWnVmYmJPbmxlZ1ZDWEhxMWJHZEVNZzZLLyswOU1RajhBNDhFQWVlaENkb0dXL3NGVTBqUlRQemVmTE5OelBPNTZ2clBMNk9FVUp6RktJQXpTTncwY21IVDZ1c3pCQUtBNGhtY0xLMDlqdGt2UVRIQmkvZ0RkeEJaVVIzdzZYcTlOMUdhYUw1aGc3OUlBa2IzaXR0R0JkYWJZeGdYTGFBR1h2ZW1MN1gzWTQ3Z2xkUENIYUQwTFFublp5VU9oRm1WM1Bwb25OcGN4MXJONGhqTW1oOGdPYy9lMmJ4N2UrZnRqMjAvWWo4YzhCLy9MWHU0cGUzVDNqR2NzSHJ0eE01NkdqUmZLenc1OTMyVU1IWnlRZ2o2RWtwUitMQjhBcTZBSHMvSVgrVGtmV3FxZmdLbDJWVDRhS2lGU2Fyc3NJcExkWXNiL0lMVGh1Znk1dVMwelROY0hXUnA3aGdSWXJKWlVad1E5YVh0TTV6eHZKNktrYVFIZmRpbGc1Y0tGTi81VlM3OE5sZURuc3U5WjJMbnlzdE85RW1ONlEzZm51bnNCTXVPL29JakxpVWc5OVRDUHYxaktFbXJmSStzNTA3dnpVZG15aGN5dUUyOFNwUDNVWm1vN1dKd2NOa2xERVFrcVNSOE1rNDBFZDBpMkZ2YndtUUJmWWFSNU9QWjNJQ25CdGhpek5NdnhqeERSZTJnQk9BbkNBbjV1Z3Z4NUp6THl6eTk1YUx0aFBINGZTazVyMEx6cURKUTQvSkhrYnJ4eFFEcWhJOWFPTHpZdmlwUERKZWx2dC84bUd4VnI0REFBQT0ifQ== -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["subject"],"name":[1],"type":["chr"],"align":["left"]},{"label":["property"],"name":[2],"type":["chr"],"align":["left"]},{"label":["string.value"],"name":[3],"type":["chr"],"align":["left"]},{"label":["numeric.value"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["error"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["unit"],"name":[6],"type":["chr"],"align":["left"]},{"label":["tags"],"name":[7],"type":["chr"],"align":["left"]},{"label":["date"],"name":[8],"type":["date"],"align":["right"]},{"label":["guid"],"name":[9],"type":["chr"],"align":["left"]}],"data":[{"1":"university:state:colorado/students:undergraduate:fulltime","2":"number","3":"NA","4":"15646","5":"NA","6":"NA","7":"","8":"2020-11-19","9":"2a61f9e1-55f9-49c9-a159-0c46d3f37ecf"},{"1":"university:state:montclair","2":"rate:graduation","3":"NA","4":"58","5":"NA","6":"%","7":"","8":"2020-11-19","9":"ef5ec002-9730-4d40-a82a-fa68cb33dd3b"}],"options":{"columns":{"min":{},"max":[10],"total":[9]},"rows":{"min":[10],"max":[10],"total":[2]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

### Visualizing description trees

Truenumber path phrases naturally imply trees the way filename paths do, revealing  relationships among data items in a useful way.  

Package *tnum* uses *data.tree* and *Diagrammer* for managing tree structures and graphs in its truenumber plotting functions. Let's see them in action.  First, we try a utility that creates a graph from a list of tnum paths, delimited by the **:** and **/** characters. We apply it to the *subject* column of the tnum data frame of aircraft data: 



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuXG4jIFVzZSB0bnVtIGZ1bmN0aW9uIHRvIGdlbmVyYXRlIGEgZ3JhcGggZnJvbSB0aGUgc3ViamVjdCBjb2x1bW4gb2YgdGhlIGRhdGEgZnJhbWUgb2YgdG51bXNcblxuZ3JhcGggPC0gdG51bS5tYWtlUGhyYXNlR3JhcGhGcm9tUGF0aExpc3QocmV0dXJuZWQub2JqZWN0cy5mcmFtZSRzdWJqZWN0KVxuXG4jIFVzZSB0aGUgdG51bSByZW5kZXJpbmcgZnVuY3Rpb24gdG8gZGlzcGxheSBpdCBhcyBhIGdyYXBoOlxuXG50bnVtLnBsb3RHcmFwaChncmFwaClcbmBgYCJ9 -->

```r

# Use tnum function to generate a graph from the subject column of the data frame of tnums

graph <- tnum.makePhraseGraphFromPathList(returned.objects.frame$subject)

# Use the tnum rendering function to display it as a graph:

tnum.plotGraph(graph)
```

<!-- rnb-source-end -->
<!--html_preserve-->
<!-- rnb-htmlwidget-begin eyJkZXBlbmRlbmNpZXMiOlt7Im5hbWUiOiJodG1sd2lkZ2V0cyIsInZlcnNpb24iOiIxLjUuMSIsInNyYyI6eyJmaWxlIjoiQzovVXNlcnMvQWxsZW4gUmF6ZG93L0RvY3VtZW50cy9SL3dpbi1saWJyYXJ5LzQuMC9odG1sd2lkZ2V0cy93d3cifSwibWV0YSI6W10sInNjcmlwdCI6Imh0bWx3aWRnZXRzLmpzIiwic3R5bGVzaGVldCI6W10sImhlYWQiOltdLCJhdHRhY2htZW50IjpbXSwicGFja2FnZSI6W10sImFsbF9maWxlcyI6dHJ1ZX0seyJuYW1lIjoidml6IiwidmVyc2lvbiI6IjEuOC4yIiwic3JjIjp7ImZpbGUiOiJDOi9Vc2Vycy9BbGxlbiBSYXpkb3cvRG9jdW1lbnRzL1Ivd2luLWxpYnJhcnkvNC4wL0RpYWdyYW1tZVIvaHRtbHdpZGdldHMvbGliL3ZpeiJ9LCJtZXRhIjpbXSwic2NyaXB0Ijoidml6LmpzIiwic3R5bGVzaGVldCI6W10sImhlYWQiOltdLCJhdHRhY2htZW50IjpbXSwicGFja2FnZSI6W10sImFsbF9maWxlcyI6dHJ1ZX0seyJuYW1lIjoiRGlhZ3JhbW1lUi1zdHlsZXMiLCJ2ZXJzaW9uIjoiMC4yIiwic3JjIjp7ImZpbGUiOiJDOi9Vc2Vycy9BbGxlbiBSYXpkb3cvRG9jdW1lbnRzL1Ivd2luLWxpYnJhcnkvNC4wL0RpYWdyYW1tZVIvaHRtbHdpZGdldHMvbGliL3N0eWxlcyJ9LCJtZXRhIjpbXSwic2NyaXB0IjpbXSwic3R5bGVzaGVldCI6InN0eWxlcy5jc3MiLCJoZWFkIjpbXSwiYXR0YWNobWVudCI6W10sInBhY2thZ2UiOltdLCJhbGxfZmlsZXMiOnRydWV9LHsibmFtZSI6ImdyVml6LWJpbmRpbmciLCJ2ZXJzaW9uIjoiMS4wLjYuMSIsInNyYyI6eyJmaWxlIjoiQzovVXNlcnMvQWxsZW4gUmF6ZG93L0RvY3VtZW50cy9SL3dpbi1saWJyYXJ5LzQuMC9EaWFncmFtbWVSL2h0bWx3aWRnZXRzIn0sIm1ldGEiOltdLCJzY3JpcHQiOiJnclZpei5qcyIsInN0eWxlc2hlZXQiOltdLCJoZWFkIjpbXSwiYXR0YWNobWVudCI6W10sInBhY2thZ2UiOltdLCJhbGxfZmlsZXMiOmZhbHNlfV0sIm1ldGFkYXRhIjp7ImNsYXNzZXMiOlsiZ3JWaXoiLCJodG1sd2lkZ2V0Il0sInNpemluZ1BvbGljeSI6eyJkZWZhdWx0V2lkdGgiOltdLCJkZWZhdWx0SGVpZ2h0IjpbXSwicGFkZGluZyI6W10sInZpZXdlciI6eyJkZWZhdWx0V2lkdGgiOltdLCJkZWZhdWx0SGVpZ2h0IjpbXSwicGFkZGluZyI6W10sImZpbGwiOlt0cnVlXSwic3VwcHJlc3MiOltmYWxzZV0sInBhbmVIZWlnaHQiOltdfSwiYnJvd3NlciI6eyJkZWZhdWx0V2lkdGgiOltdLCJkZWZhdWx0SGVpZ2h0IjpbXSwicGFkZGluZyI6W10sImZpbGwiOltmYWxzZV0sImV4dGVybmFsIjpbZmFsc2VdfSwia25pdHIiOnsiZGVmYXVsdFdpZHRoIjpbXSwiZGVmYXVsdEhlaWdodCI6W10sImZpZ3VyZSI6W3RydWVdfSwidmlld2VyLnBhZGRpbmciOlswXSwidmlld2VyLmZpbGwiOlt0cnVlXX19fQ== -->

<!-- htmlwidget-container-begin -->
<div id="htmlwidget-696293688a72337df0bc" style="width:500px;height:500px;" class="grViz html-widget"></div>
<!-- htmlwidget-container-end -->
<script type="application/json" data-for="htmlwidget-696293688a72337df0bc">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"university\\n(root)\", shape = \"ellipse\", color = \"black\", fixedsize = \"FALSE\", fillcolor = \"#FFFFFF\", fontcolor = \"#000000\"] \n  \"2\" [label = \"state\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fillcolor = \"#FFFFFF\", fontcolor = \"#000000\"] \n  \"3\" [label = \"colorado\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fillcolor = \"#FFFFFF\", fontcolor = \"#000000\"] \n  \"4\" [label = \"students\", shape = \"ellipse\", color = \"black\", fixedsize = \"FALSE\", fillcolor = \"#FFFFFF\", fontcolor = \"#000000\"] \n  \"5\" [label = \"undergraduate\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fillcolor = \"#FFFFFF\", fontcolor = \"#000000\"] \n  \"6\" [label = \"fulltime\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fillcolor = \"#FFFFFF\", fontcolor = \"#000000\"] \n  \"7\" [label = \"montclair\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fillcolor = \"#FFFFFF\", fontcolor = \"#000000\"] \n\"1\"->\"2\" [color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"2\"->\"3\" [color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"3\"->\"4\" [color = \"black\", fontcolor = \"grey\", label = \"pos.\", label = \"pos.\", style = \"dashed\"] \n\"4\"->\"5\" [color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"5\"->\"6\" [color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"2\"->\"7\" [color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
<!-- htmlwidget-sizing-policy-base64 PHNjcmlwdCB0eXBlPSJhcHBsaWNhdGlvbi9odG1sd2lkZ2V0LXNpemluZyIgZGF0YS1mb3I9Imh0bWx3aWRnZXQtNjk2MjkzNjg4YTcyMzM3ZGYwYmMiPnsidmlld2VyIjp7IndpZHRoIjo0NTAsImhlaWdodCI6MzUwLCJwYWRkaW5nIjoxNSwiZmlsbCI6dHJ1ZX0sImJyb3dzZXIiOnsid2lkdGgiOjk2MCwiaGVpZ2h0Ijo1MDAsInBhZGRpbmciOjQwLCJmaWxsIjpmYWxzZX19PC9zY3JpcHQ+ -->

<!-- rnb-htmlwidget-end -->
<!--/html_preserve-->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

These plots render tnum paths in keeping with their intent as encodings of descriptive phrases.  In the phrase "students of montclair state university", or **university:state:montclair/students**, "state" functions as an adjective modifying noun "university" in a rounded shape. The square node and solid arrow denote that binding of adjective and noun as an entity description.  The "students of" or **/students** is a possessive form, shown as the dotted relationship arrow.  It's important to keep in mind that these encode descriptions, not specific structural relationships as a class or entity-relationship diagram would.  Think of phrases as explicit versions of what would normally be unstructured metadata like variable names or column names. 

### Adding knowledge with tags

For now, we can assume that state universities are public institutions.  Let's add this information to our tnums by applying appropriate tag:

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuIyBhZGQgYSB0YWcgdG8gaW5zdGl0dXRpb25zIG5hbWVkIFwiLi4uIHN0YXRlIHVuaXZlcnNpdHlcIlxudG51bS50YWdCeVF1ZXJ5KFwidW5pdmVyc2l0eTpzdGF0ZSMgaGFzICpcIixsaXN0KFwiaW5zdGl0dXRpb246cHVibGljXCIpKVxuYGBgIn0= -->

```r
# add a tag to institutions named "... state university"
tnum.tagByQuery("university:state# has *",list("institution:public"))
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoibGlzdChtb2RpZmllZENvdW50ID0gMiwgdGFnZ2VkID0gMiwgcmVtb3ZlZCA9IDApXG4ifQ== -->

```
list(modifiedCount = 2, tagged = 2, removed = 0)
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

Now let's use a function that graphs tnum subjects, properties and tags together:

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuIyBmaXJzdCByZS1xdWVyeSB0aGUgZGF0YWJhc2UgdG8gZ2V0IHRoZSBuZXcgdGFnc1xudG4ub2JqZWN0cyA8LSB0bnVtLnF1ZXJ5KFwidW5pdmVyc2l0eSMgaGFzICpcIilcbmBgYCJ9 -->

```r
# first re-query the database to get the new tags
tn.objects <- tnum.query("university# has *")
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiUmV0dXJuZWQgMSB0aHJ1IDIgb2YgMiByZXN1bHRzXG4ifQ== -->

```
Returned 1 thru 2 of 2 results
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuIyBjcmVhdGUgdGhlIGdyYXBoIGFuZCBzaG93IGFsbCB0YWdzXG50Z3JhcGggPC0gdG51bS5tYWtlVG51bVBocmFzZUdyYXBoKHRuLm9iamVjdHMsIHRhZ3BhdHRlcm4gPSBcIi4rXCIpXG5cbnRudW0ucGxvdEdyYXBoKHRncmFwaClcbmBgYCJ9 -->

```r
# create the graph and show all tags
tgraph <- tnum.makeTnumPhraseGraph(tn.objects, tagpattern = ".+")

tnum.plotGraph(tgraph)
```

<!-- rnb-source-end -->
<!--html_preserve-->
<!-- rnb-htmlwidget-begin eyJkZXBlbmRlbmNpZXMiOlt7Im5hbWUiOiJodG1sd2lkZ2V0cyIsInZlcnNpb24iOiIxLjUuMSIsInNyYyI6eyJmaWxlIjoiQzovVXNlcnMvQWxsZW4gUmF6ZG93L0RvY3VtZW50cy9SL3dpbi1saWJyYXJ5LzQuMC9odG1sd2lkZ2V0cy93d3cifSwibWV0YSI6W10sInNjcmlwdCI6Imh0bWx3aWRnZXRzLmpzIiwic3R5bGVzaGVldCI6W10sImhlYWQiOltdLCJhdHRhY2htZW50IjpbXSwicGFja2FnZSI6W10sImFsbF9maWxlcyI6dHJ1ZX0seyJuYW1lIjoidml6IiwidmVyc2lvbiI6IjEuOC4yIiwic3JjIjp7ImZpbGUiOiJDOi9Vc2Vycy9BbGxlbiBSYXpkb3cvRG9jdW1lbnRzL1Ivd2luLWxpYnJhcnkvNC4wL0RpYWdyYW1tZVIvaHRtbHdpZGdldHMvbGliL3ZpeiJ9LCJtZXRhIjpbXSwic2NyaXB0Ijoidml6LmpzIiwic3R5bGVzaGVldCI6W10sImhlYWQiOltdLCJhdHRhY2htZW50IjpbXSwicGFja2FnZSI6W10sImFsbF9maWxlcyI6dHJ1ZX0seyJuYW1lIjoiRGlhZ3JhbW1lUi1zdHlsZXMiLCJ2ZXJzaW9uIjoiMC4yIiwic3JjIjp7ImZpbGUiOiJDOi9Vc2Vycy9BbGxlbiBSYXpkb3cvRG9jdW1lbnRzL1Ivd2luLWxpYnJhcnkvNC4wL0RpYWdyYW1tZVIvaHRtbHdpZGdldHMvbGliL3N0eWxlcyJ9LCJtZXRhIjpbXSwic2NyaXB0IjpbXSwic3R5bGVzaGVldCI6InN0eWxlcy5jc3MiLCJoZWFkIjpbXSwiYXR0YWNobWVudCI6W10sInBhY2thZ2UiOltdLCJhbGxfZmlsZXMiOnRydWV9LHsibmFtZSI6ImdyVml6LWJpbmRpbmciLCJ2ZXJzaW9uIjoiMS4wLjYuMSIsInNyYyI6eyJmaWxlIjoiQzovVXNlcnMvQWxsZW4gUmF6ZG93L0RvY3VtZW50cy9SL3dpbi1saWJyYXJ5LzQuMC9EaWFncmFtbWVSL2h0bWx3aWRnZXRzIn0sIm1ldGEiOltdLCJzY3JpcHQiOiJnclZpei5qcyIsInN0eWxlc2hlZXQiOltdLCJoZWFkIjpbXSwiYXR0YWNobWVudCI6W10sInBhY2thZ2UiOltdLCJhbGxfZmlsZXMiOmZhbHNlfV0sIm1ldGFkYXRhIjp7ImNsYXNzZXMiOlsiZ3JWaXoiLCJodG1sd2lkZ2V0Il0sInNpemluZ1BvbGljeSI6eyJkZWZhdWx0V2lkdGgiOltdLCJkZWZhdWx0SGVpZ2h0IjpbXSwicGFkZGluZyI6W10sInZpZXdlciI6eyJkZWZhdWx0V2lkdGgiOltdLCJkZWZhdWx0SGVpZ2h0IjpbXSwicGFkZGluZyI6W10sImZpbGwiOlt0cnVlXSwic3VwcHJlc3MiOltmYWxzZV0sInBhbmVIZWlnaHQiOltdfSwiYnJvd3NlciI6eyJkZWZhdWx0V2lkdGgiOltdLCJkZWZhdWx0SGVpZ2h0IjpbXSwicGFkZGluZyI6W10sImZpbGwiOltmYWxzZV0sImV4dGVybmFsIjpbZmFsc2VdfSwia25pdHIiOnsiZGVmYXVsdFdpZHRoIjpbXSwiZGVmYXVsdEhlaWdodCI6W10sImZpZ3VyZSI6W3RydWVdfSwidmlld2VyLnBhZGRpbmciOlswXSwidmlld2VyLmZpbGwiOlt0cnVlXX19fQ== -->

<!-- htmlwidget-container-begin -->
<div id="htmlwidget-155ed8c965229dbce41f" style="width:500px;height:500px;" class="grViz html-widget"></div>
<!-- htmlwidget-container-end -->
<script type="application/json" data-for="htmlwidget-155ed8c965229dbce41f">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"tnums\\n(root)\", shape = \"ellipse\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"2\" [label = \"university\", shape = \"ellipse\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"3\" [label = \"state\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"4\" [label = \"colorado\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"5\" [label = \"students\", shape = \"ellipse\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"6\" [label = \"undergraduate\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"7\" [label = \"fulltime\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"8\" [label = \"number\", shape = \"ellipse\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"9\" [label = \"institution:public\", shape = \"plaintext\", color = \"gray70\", fixedsize = \"FALSE\", fontcolor = \"#338033\", fillcolor = \"#FFFFFF00\"] \n  \"10\" [label = \"montclair\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"11\" [label = \"rate\", shape = \"ellipse\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"12\" [label = \"graduation\", shape = \"rectangle\", color = \"black\", fixedsize = \"FALSE\", fontcolor = \"gray50\", fillcolor = \"#FFFFFF\"] \n  \"13\" [label = \"\\ninstitution:public\", shape = \"plaintext\", color = \"gray70\", fixedsize = \"FALSE\", fontcolor = \"#338033\", fillcolor = \"#FFFFFF00\"] \n\"1\"->\"2\" [style = \"dashed\", color = \"black\", fontcolor = \"grey\", label = \"pos.\", label = \"pos.\", label = \"pos.\"] \n\"2\"->\"3\" [label = \"pos.\", color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"3\"->\"4\" [dir = \"back\", color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"4\"->\"5\" [style = \"dashed\", color = \"black\", fontcolor = \"grey\", label = \"pos.\", label = \"pos.\", label = \"pos.\"] \n\"5\"->\"6\" [label = \"pos.\", color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"6\"->\"7\" [dir = \"back\", color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"7\"->\"8\" [dir = \"back\", color = \"lightgrey\", fontcolor = \"lightgrey\", label = \"HAS\", label = \"HAS\", arrowhead = \"none\"] \n\"8\"->\"9\" [arrowhead = \"none\", color = \"lightgrey\", color = \"lightgrey\", color = \"lightgrey\", color = \"lightgrey\", arrowhead = \"none\"] \n\"3\"->\"10\" [arrowhead = \"none\", color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"10\"->\"11\" [dir = \"back\", color = \"lightgrey\", fontcolor = \"lightgrey\", label = \"HAS\", label = \"HAS\", arrowhead = \"none\"] \n\"11\"->\"12\" [arrowhead = \"none\", color = \"black\", fontcolor = \"grey\", label = \"adj.\", dir = \"back\", dir = \"back\"] \n\"12\"->\"13\" [dir = \"back\", color = \"lightgrey\", color = \"lightgrey\", color = \"lightgrey\", color = \"lightgrey\", arrowhead = \"none\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
<!-- htmlwidget-sizing-policy-base64 PHNjcmlwdCB0eXBlPSJhcHBsaWNhdGlvbi9odG1sd2lkZ2V0LXNpemluZyIgZGF0YS1mb3I9Imh0bWx3aWRnZXQtMTU1ZWQ4Yzk2NTIyOWRiY2U0MWYiPnsidmlld2VyIjp7IndpZHRoIjo0NTAsImhlaWdodCI6MzUwLCJwYWRkaW5nIjoxNSwiZmlsbCI6dHJ1ZX0sImJyb3dzZXIiOnsid2lkdGgiOjk2MCwiaGVpZ2h0Ijo1MDAsInBhZGRpbmciOjQwLCJmaWxsIjpmYWxzZX19PC9zY3JpcHQ+ -->

<!-- rnb-htmlwidget-end -->
<!--/html_preserve-->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


### Cleaning up after our example

If we use tags and phrases with enough specificity, we can keep our truenumbers around.  If we choose to clean some of them up, We can use a query not to retrieve, but to delete and select tnums:

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxudG51bS5kZWxldGVCeVF1ZXJ5KFwidW5pdmVyc2l0eSMgaGFzICpcIilcbmBgYCJ9 -->

```r
tnum.deleteByQuery("university# has *")
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoibGlzdChyZW1vdmVkID0gMilcbiJ9 -->

```
list(removed = 2)
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->







<!-- rnb-text-end -->

