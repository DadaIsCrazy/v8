#!/usr/bin/perl -n

BEGIN {
  @ARGV = grep {$_ eq '--all' ? do { $all = 1; undef} : 1 } @ARGV;
}

use feature 'say';
use Data::Printer;

$SIG{INT} = sub {};


if (/Allocate\((\d+)\)/) {
  $alloc{$1}++;
}
if (! $all) {
  if (/(.+?): / && %alloc) {
    say $1;
    p %alloc;
    %alloc = ();
  }
}
END {
  if ( $all ) {
    p %alloc;  
  }
}
