#!/usr/bin/env perl

use strict;
use warnings;

while (<STDIN>) {
  if ($_ =~ m/^>/) {
    print "Header found\n";
  } else {
    print "Not a header\n";
  }
}
