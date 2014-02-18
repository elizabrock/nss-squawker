# Squawker

## Summary

This is the basis of the pair projects for capstone 3, for cohort 3 at Nashville Software School.

This is a basic twitter clone.

## Project Setup

1. Install the imagemagick
  `brew install imagemagick` (on OS X)
1. Create the databases:
  `rake db:create:all`
2. Run the migrations:
  `rake db:migrate`
3. Add application.yml file to [config/](config/) folder that follows example in [config/application.yml.example](config/application.yml.example)
4. Start the app:
  `rails s`


## Badges of Honor

[![Build Status](https://travis-ci.org/elizabrock/nss-squawker.png)](https://travis-ci.org/elizabrock/nss-squawker)
<a href="https://codeclimate.com/repos/52fd1f7869568042a7000c75/feed"><img src="https://codeclimate.com/repos/52fd1f7869568042a7000c75/badges/d946e749b28293239339/gpa.png"></a>
<a href="https://codeclimate.com/repos/52fd1f7869568042a7000c75/feed"><img src="https://codeclimate.com/repos/52fd1f7869568042a7000c75/badges/d946e749b28293239339/coverage.png"></a>
[![Coverage Status](https://coveralls.io/repos/elizabrocksoftware/nss-squawker/badge.png)](https://coveralls.io/r/elizabrocksoftware/nss-squawker)
