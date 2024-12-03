# Run with perl part2.pl input.txt


my (@vals1, @vals2);

# Load from file into arrays
# 1st value before whitespace goes into @vals1, 2nd into @vals2

while (<>) {
    # Split on whitespace
    my ( $val1, $val2 ) = split /\s+/;

    push @vals1, $val1;
    push @vals2, $val2;
}

# Count the number of times each element occurs in the "right list" (@vals2)

my %occurances;

foreach (@vals2) {
    $occurances{$_} += 1;
}

# Create an array with the left value * occurances

my @similarities = map { $_ * $occurances{$_} } @vals1;

# Sum them

my $total;
map { $total += $_ } @similarities;

print "Similarity score is: $total\n"

