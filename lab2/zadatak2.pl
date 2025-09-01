#!/usr/bin/perl

@lista = ();
$zbroj;

while (<>) {
    chomp;
    if (! m/\d/) {
        last;
    } 
    push @lista, $_;
}

foreach $e (@lista) {
    $zbroj += $e;
}

$avg = $zbroj / ($#lista + 1);
print "Aritmetički zbroj je: $avg\n";t