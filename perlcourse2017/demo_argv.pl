#!/usr/bin/env perl

use strict;
use warnings;

my @input_arguments = @ARGV; # Read command line arguments

print "Your first command line argument was: ";
print $input_arguments[0]; # Print the first one
print "\n";

print "One more time now: ";
print $ARGV[0]; # does the same thing
print "\n";
