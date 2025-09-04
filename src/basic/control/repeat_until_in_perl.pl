# src/basic/control/repeat_until_in_perl.pl
sub main {
    my $prev = 0;
    my $curr = 1;
    my $threshold = 1_000_000_000;

    do {
        ($prev, $curr) = ($curr, $prev + $curr);
    } until ($curr > $threshold);

    print "First Fibonacci number > $threshold: $curr\n";
}

main();