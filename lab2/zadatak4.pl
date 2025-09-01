#!/usr/bin/perl
use warnings;

while (<>) {
    chomp;
    if (m/^(\d{10});([\wčćžšđČĆŽŠĐ]+);([\wčćžšđČĆŽŠĐ]+);(\d{4}-\d{2}-\d{2}) (\d{2}):\d{2} \d{2}:\d{2} \w+;(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2}:\d{2})$/) {
        my ($jmbag, $prezime, $ime, $datum_start, $sat_pocetka, $datum_end, $vrijeme_zavrsetka) = ($1, $2, $3, $4, $5, $6, $7);

        my @polje = split /:/, $vrijeme_zavrsetka;
        my $sekunde_pocetka = $sat_pocetka * 3600;
        my $sekunde_zavrsetka = $polje[0] * 3600 + $polje[1] * 60 + $polje[2];

        # Ako je datum predaje veći, dodaj 24 sata
        if ($datum_start ne $datum_end) {
            $sekunde_zavrsetka += 24 * 3600;
        }

        if ( ($sekunde_zavrsetka - $sekunde_pocetka) > 3600 ) {
            print "$jmbag $ime $prezime - PROBLEM: $datum_start $sat_pocetka:00 --> $datum_end $vrijeme_zavrsetka\n";
        }
    }
}