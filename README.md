# Subtool

[![Build Status](https://travis-ci.org/0livier/subtool.png)](https://travis-ci.org/0livier/subtool) [![Code Climate](https://codeclimate.com/github/0livier/subtool.png)](https://codeclimate.com/github/0livier/subtool) [![Gem Version](https://badge.fury.io/rb/subtool.png)](http://badge.fury.io/rb/subtool)

subtool is a commandline tool that help fix the timing of subtitles files.

## Installation

Install it using the gem command:

    gem install subtool

## Usage

    subtool -i subtitle.srt add > output.srt
    subtool < subtitle.srt remove 3.5 -o output.srt
    subtool --help

## Want another tool ?

There are several other tools to manipulate SRT files. Among them,

* https://github.com/remram44/srt-shift
* http://www.aegisub.org/
* https://github.com/thiagokimo/srt-shifter
* https://github.com/georgyvlad/srt


## Reporting Bugs

Thanks for taking the time of giving the project an opportunity to enhance. Please use the Github tracker.


## Submitting Patches or Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so future version won't break unintentionally.
* Commit
* Send a pull request.


## Copyright

Copyright (c) 2012 creativ-IT. See LICENSE for legal mumbo jumbo.