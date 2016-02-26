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

Second, it shows the distribution of those in the sample with matching characteristics so a user can get an idea of how much emphasis to put on a particular method.

*Disclaimer: VoteSway is a project for the Coursera Developing Data Products class. No claims are made as to the validity or accuracy of the information generated.*

--- .class #id 

## How it works

The **Pew Research Foundation** survey data provides the basis for how VoteSway works.

Five means of communication were offered to people who answered the survey:

1. Face-to-Face
2. Phone call (voice)
3. Email
4. Text message
5. Post to social media

A Random Forest model was used to build an algorithm to predict which method is most effective.


<style>
em {
  font-style: italic
}
</style>

<style>
strong {
  font-weight: bold;
}
</style>

__*One big assumption: We assume that if people said they would use this method, it would also be effective on them.*__

---

## Some Details


The survey identified the preferred communication method by age, sex and education level.

![plot of chunk tree](assets/fig/tree-1.png)

The above chart shows the distribution of the total survey sample across the various communication methods.

It is not surprising that this distribution varies by characteristics.  VoteSway lets you find the most effective way to communicate given the personal profile of an individual.

---

## What it looks like

Below is a portion of the VoteSway application main panel and sidebar panel. 

Click [here](https://hydrakos01.shinyapps.io/shiny_stuff/) to start VoteSway
 
![alt text][VoteSway]

[VoteSway]: http://hydrakos.com/wp-content/uploads/2016/02/VoteSway.png "VoteSway "

The github repository for VoteSway is here: https://github.com/EAMarcar/VoteSway


    



