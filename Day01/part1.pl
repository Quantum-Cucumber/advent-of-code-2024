# Run with perl part1.pl input.txt


my (@vals1, @vals2);

# Load from file into arrays
# 1st value before whitespace goes into @vals1, 2nd into @vals2

while (<>) {
    # Split on whitespace
    my ( $val1, $val2 ) = split /\s+/;

    push @vals1, $val1;
    push @vals2, $val2;
}

@vals1 = sort @vals1;
@vals2 = sort @vals2;


# Calculate the distance between each pair of elements

my @deltas;

for my $i (0..$#vals1) {
    my $dist = abs @vals1[$i] - @vals2[$i];
    push @deltas, $dist;
}

# Sum them

my $total;
map { $total += $_ } @deltas;

print "Total is: $total\n"
