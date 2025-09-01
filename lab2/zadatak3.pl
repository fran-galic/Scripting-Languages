#!/usr/bin/perl

@files = @ARGV;

foreach $file (@files) {
    @ARGV = ($file);
    print "\n" . "Datum: ";
    if ($file =~ /([\d]{4}-[\d]{2}-[\d]{2})/) {
        print "$1\n";
    }
    print "sat : broj pristupa\n";
    print "-------------------------------\n";

    %dict = ();
    while (<>) {
        chomp;
        /[\d]{4}:([\d]{2}):[\d]{2}:[\d]{2}/;
        $dict{$1}++;
    }

    for $key (sort {$a <=> $b} keys %dict) {
        print "$key : $dict{$key}\n";
    }

}
