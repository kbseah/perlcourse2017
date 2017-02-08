#!/usr/bin/perl
# written by Juliane Wippler 2016-02-08 (Perl course)
use strict;
use warnings;
use diagnostics;

while (<STDIN>) {
  chomp;
  if (/(C)D(S)/) {
    print "$1\n";
    print "$2\n";
  } 
}