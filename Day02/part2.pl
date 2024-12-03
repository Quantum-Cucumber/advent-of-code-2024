# Run with perl part2.pl input.txt

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


# Brute force taking a step out of the sequence and see if we can find one that works
sub find_viable_combo {
    my ($report) = @_;

    # Try report with no changes. If it is valid then return 1. It works
    return 1 if is_report_safe $report;

    # Make into array to iterate over
    my @report = split /\s/, $report;

    # Remove items one by one and test result
    for my $i ( 0..$#report ) {
        # Copy @report so that we can splice it
        my @modified_report = @report;
        # Remove the element at the current index
        splice ( @modified_report, $i, 1 );
        # Stick the report back into a scalar
        my $modified_report = join " ", @modified_report;

        # Test the new report and return 1 if it is safe
        return 1 if is_report_safe $modified_report;
    }

    return 0;
}


my $safe_report_count;

while (<>) {
    $safe_report_count += 1 if find_viable_combo $_;
}

print $safe_report_count . " have viable safe combos\n";
