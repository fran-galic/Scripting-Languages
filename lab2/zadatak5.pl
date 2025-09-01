#!/usr/bin/perl
use warnings;

my @udjeli;
my %baza;

while (<>) {
    chomp;
    if ($_ !~ /^#/ && $_ !~ /^\s*$/) {
        @udjeli = split /;/ , $_;
        last;
    }
}

print "Lista po rangu:\n";
print "-------------------\n";

while (<>) {
    chomp;
    if ($_ !~ /^#/ && $_ !~ /^\s*$/) {
        my $ukupni_bodovi = 0;
        /([\d]{10});([\wčćžšđČĆŽŠĐ]+);([\wčćžšđČĆŽŠĐ]+);(.*)/;
        my ($jmbag, $prezime, $ime, $string_bodovi) = ($1, $2, $3, $4);
        my @bodovi_polje = split /;/ , $string_bodovi;

        if ($#udjeli != $#bodovi_polje) {
            die "Broj ocjena i broj udjela mora biti isti";
        }
        for my $i (0 .. $#udjeli) {
            if ($bodovi_polje[$i] ne "-") {
                $ukupni_bodovi += $bodovi_polje[$i] * $udjeli[$i];
            }
        }
        $baza{"$prezime, $ime ($jmbag)"} = $ukupni_bodovi;
    }
}

my $rbr = 1;
foreach my $key (sort { $baza{$b} <=> $baza{$a} } keys %baza) {
    printf "%3d. %-40s : %4.2f\n", $rbr++, $key, $baza{$key};
}