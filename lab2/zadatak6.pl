#!/usr/bin/perl
use warnings;
use utf8;
use open ':locale';
use locale;

if (@ARGV == 0) {
    die "Potrebno je unijeti barem duljinu prefiksa kao argument.\n";
}

my $duljina_prefiksa = pop @ARGV;
@ARGV = ('-') if scalar(@ARGV) == 0;

my %dict;

while (<>) {
    chomp;
    my @polje_rijeci = split /\PL+/, $_;

    foreach my $w (@polje_rijeci) {
        $w = lc($w);
        next if (length($w) < $duljina_prefiksa);

        my $prefiks = substr($w, 0, $duljina_prefiksa);
        $dict{$prefiks}++;
    }
}

foreach my $prefiks (sort keys %dict) {
    print "$prefiks : $dict{$prefiks}\n";
}