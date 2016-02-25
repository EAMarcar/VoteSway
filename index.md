---
title       : Introduction to VoteSway
subtitle    : Data Products Course Project
author      : Edmund A Marcarelli
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## What it does

### Have a candidate for political office you want to support?

Find the most effective way to communicate your thoughts to friends and family based on their age, sex and education level.

## VoteSway

*VoteSway* works in two ways. First, it uses data from a [Pew Research survey](http://www.pewinternet.org/2012/11/06/social-media-and-voting/
) to predict the best way to communicate with someone given the common ways we communicate with each other.

Second, it shows the distribution of those in the sample with matching characteristices so a user can get an idea of how much emphasis to put on a particular method.

--- .class #id 

## How it works

Data from **Pew Research Foundation** provides the basis

Five means of communication were offered:

1. Face-to-Face
2. Phone call (voice)
3. Email
4. Text message
5. Post to social media

A Random Forest model was use do build an algorythm to predict which method is most effective.


<style>
em {
  font-style: italic
}
</style>

*One big assumption: We assume that if people said they would use this method, it would also be effective on them.*

---

## Some Details


The survey identified the preferred communication method by age, sex and education level.

![plot of chunk tree](assets/fig/tree-1.png)

---

## What it looks like





