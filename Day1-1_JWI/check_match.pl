#!/usr/bin/perl
# written by Juliane Wippler 2016-02-08 (Perl course)
use strict;
use warnings;
use diagnostics;

while (<STDIN>) {
  chomp;
  if (/YOUR_PATTERN_HERE/) {
    print "Matched!\n";
  } else {
    print "No match :(\n";
  }
}