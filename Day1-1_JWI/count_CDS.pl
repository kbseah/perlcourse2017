#!/usr/bin/perl
# written by Juliane Wippler 2016-02-08 (Perl course)
use strict;
use warnings;
use diagnostics;


my $count = 0;
while (<STDIN>) {
  chomp;
  if (/CDS/) {
    $count++;
  }
}
print "CDS was found $count times\n";