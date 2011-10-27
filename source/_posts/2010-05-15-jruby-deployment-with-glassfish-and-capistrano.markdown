---
layout: post
title: "JRuby Deployment with Glassfish and Capistrano"
date: 2010-05-15 12:00
comments: true
categories:
---
At [CollegeJobConnect](http://collegejobconnect.com/), we need to process Word and PDF-format resumes that we receive from our members.
In order to carefully curate our initial candidate pool, we have done a lot of this work by hand.
However, as we grow we need to automate as much of the registration process as we can.
This involves using automated text extraction to retrieve some basic attributes from these files.
Fortunately, there are some great [open](http://poi.apache.org/) [source](http://pdfbox.apache.org/) tools out there
that wrangle Word and PDF documents into raw text. Unfortunately, they are written in Java.  Enter [JRuby](http://jruby.org/).

JRuby makes our job drop-dead simple.  We can tap into the Java libraries we need, while keeping our code in the language we love.
Unfortunately, the state-of-the-art in JRuby deployment is in a bit of disarray.
Charles Nutter does a good job of guiding the decision in his [August 2009 blog post](http://blog.headius.com/2009/08/which-deployment-for-jruby-on-rails.html).
We settled on his recommended approach for simple apps — GlassFish gem.  However, things fell apart in the details.
A [post on Jacob Kessler’s blog](http://blogs.sun.com/Jacobkessler/entry/capistrano_and_glassfish_now_with) at Sun provided some guidance,
but we had trouble getting his deployment script working properly.
We also wanted something that we could administer with initscripts, to DRY out process control.
After a few hours of head-scratching frustration, we got things running.  Here’s how:

## Prerequisites

* Java 6 JRE (sun-java6-jre on Ubuntu)
* JRuby 1.5
* Git

(Our server is running Ubuntu 10.04 LTS "Lucid Lynx", but this should work in 9.10 and 8.04, and with minor adjustments in any similar Unix environment.)

## Getting It Done

1\. Install GlassFish gem: `sudo jruby -S gem install glassfish`

2\. Capify your JRuby application. From your application’s root directory, run `capify .`

3\. Customize `config/deploy.rb` for GlassFish.  (Change the ”example_app” references to match your app.) {% gist 402402 %}

4\. Install the glassfish-example_app initscript in /etc/init.d.  (Change the “example_app” references and customize the GlassFish arguments to suit your fancy.) {% gist 402405 %}

5\. Install the initscript in rc.d (this will only work on Ubuntu/Debian):
       sudo update-rc.d glassfish-example_app defaults

6\. Deploy your app with cap deploy.

... and you’re done! Post in the comments if you have any comments or questions.  If this saves you time, let me know!
