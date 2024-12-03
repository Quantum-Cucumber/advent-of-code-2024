# Run with perl part1.pl input.txt

my $cmd_re = qr/mul\(\d{1,3},\d{1,3}\)/;

my $inp = join "", <>;

my @results = map { 

    # Extract digits, multiply them
    my @vals = $_ =~ /\d+/g;
    $vals[0] * $vals[1];

} $inp =~ /$cmd_re/g;

# Sum them

my $total;
map { $total += $_ } @results;

print "Total is: $total\n"
