# Intro

This is an example Watir-WebDriver & Cucumber test suite written against Etsy.com

Build Status: [![Build Status](https://secure.travis-ci.org/alisterscott/EtsyWatirWebDriver.png)](http://travis-ci.org/alisterscott/EtsyWatirWebDriver)

# Requirements

* RVM on Mac OSX / Linux
* Pik/JRuby/Bundler/Wac on Windows 

# Installation and Usage

1. Clone this repository from Github

# Mac OSX / Linux

1. ensure you have RVM (Ruby Version Manager) installed: http://rvm.beginrescueend.com/
2. run ./go in the root directory: this will bootstrap everything needed and run the cucumber feature

# Windows

1. Install JRuby, Pik, Bundler and Wac (see my blog post: http://wp.me/p98zF-ca)
2. Make sure you 'pik' JRuby
3. In root directory, run 'bundle install'
4. Then run 'bundle exec rake'