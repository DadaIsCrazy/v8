#!/usr/bin/perl -n

use feature 'say';
use Data::Printer;


if (/Allocate\((\d+)\)/) {
  $alloc{$1}++;
}
if (/(.+?): / && %alloc) {
  say $1;
  p %alloc;
  %alloc = ();
}
