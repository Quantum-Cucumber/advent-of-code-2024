# Run with perl part2.pl input.txt

# Run with perl part1.pl input.txt

my $mul_re = qr/mul\(\d{1,3},\d{1,3}\)/;
my $do_re = qr/do\(\)/;
my $dont_re = qr/don't\(\)/;

my $cmd_re = qr/($mul_re|$do_re|$dont_re)/;

# Get input file contents

my $inp = join "", <>;

# Find all commands

my @cmds = $inp =~ /$cmd_re/g;

# Mark whether the last statement was do() (1) or don't() (0)
my $mul_flag = 1;

my @mul_results;

# Process each command
foreach my $cmd (@cmds) {
    if ( $cmd =~ /$do_re/ ) {
        $mul_flag = 1;
    }
    elsif ( $cmd =~ /$dont_re/ ) {
        $mul_flag = 0;
    }

    else {  # mul
        if ($mul_flag == 1) {
            # Multiply the params of mul()

            my @vals = $cmd =~ /\d+/g;
            push @mul_results, $vals[0] * $vals[1];
        }
    }
}

# Sum them

my $total;
map { $total += $_ } @mul_results;

print "Total is: $total\n"
