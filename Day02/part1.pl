# Run with perl part1.pl input.txt

sub is_report_safe {

    my ($report) = @_;
    #print "$report\n";

    my @levels = split /\s/, $report;

    # Work out whether the list should be ascending or descending
    #  1 = Ascending list
    # -1 = Descending list
    my $sign;
    $sign = 1 if $levels[0] < $levels[1];
    $sign = -1 if $levels[0] > $levels[1];
    # This is immediately invalid
    # "adjacent levels differ by *at least one*"
    return 0 if $levels[0] == $levels[1];


    # Step through elements and compare i & i+1 to ensure they are in range

    for my $i (0..$#levels-1) {
        # Get current and subsequent value
        my $val1 = $levels[$i];
        my $val2 = $levels[$i + 1];

        my $step = $val2 - $val1;
        #print "$sign $step\n";
        # If $sign is -1 then $step must be between -1 and -3
        return 0 if ( $sign == -1 and not ( $step <= -1  and $step >= -3 ) );
        # If $sign is 1, then $step must be between 1 and 3
        return 0 if ( $sign == 1 and not ( $step >= 1  and $step <= 3 ) );
    }

    # No unsafe steps, therefore is safe :3
    return 1;
}

my $safe_report_count;

while (<>) {
    $safe_report_count += 1 if is_report_safe $_;
}

print $safe_report_count . " are safe\n";
