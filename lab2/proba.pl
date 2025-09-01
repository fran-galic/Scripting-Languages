#!/usr/bin/perl
use warnings;
use strict;

my %count;
@ARGV = ('-') if @ARGV == 0;

while (<>) {
    if (/^From:\s.*<([\w.\-]+\@[\w.\-]+)>/) {
        $count{$1}++;
    }
}

foreach my $email (sort { $count{$a} <=> $count{$b} } keys %count) {
    printf "%35s: %s (%d)\n", $email, '*' x $count{$email}, $count{$email};
}
