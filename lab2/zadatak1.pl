#!/usr/bin/perl

print "Upišite željeni string: ";
chomp($string = <STDIN>);
print "Upišite traženi broj ponavljanja: ";
chomp($n = <STDIN>);

foreach (1..$n) {
    print "$string" . "\n";
}   