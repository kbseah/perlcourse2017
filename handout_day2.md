# Handout Day 2

## Arrays

```perl
my @array = ();  # declare an empty array
my (@array, $value) = ((),0); # declare an empty array and a scalar with value 0
@array = (1..25);  # declares an array with the values from 1 to 25
```

---

 * Push: add one or more values to the end of an array `push @updated_students, 'Jane';`
 * Push: add an array to an array `push @updated_students, @others;`
 * Pop: remove the last element of an array `$last = pop @updated_students;`

---

```perl
$scalar = \@array;   # reference of @array (address)
$scalar->[10];       # element 11 of @array
$$scalar[10];        # element 11 of @array (same as before)
@{$scalar};          # same as @array
```

---

 * Shift: removes first element of the array `my $first = shift @updated_students;`
 * Unshift: add elements at the beginning of the array `unshift @updated_students, 'Marie';`
 * Add a second array:  `unshift @updated_students, @others;`
 * Split: Cut a string into pieces and create an array

---

```perl
my $str = "ab cd ef gh ij";
my @words = split / /, $str;
```

---

 * Join elements of an array by a character `$str = join ':', @names;`
 * Join array elements and a string `$str2 = join '', @names, 'Baz';`

## Hashes

```perl
$scalar = \%hash;    # reference to %hash
%{$scalar};          # same as %hash
```

---

 * Creates an array with the values of the hash: `my @colors = values(%colors_of); `
 * Checking for the existence of keys:  `if( exists($colors_of{$check_fruit} ) ){}`
 * Keys of a hash are stored in an array: `@fruits = keys %colors_of;`
 * The keys can be sorted and printed:

---

```perl
foreach $fruit (sort (@fruits))   {
    print "$fruit $color_of{ $fruit } \n";
}
```

---

## Sorting arrays

 * Sort arrays with `sort`
 * Compare numerical variables with `<=>`
 * Compare character variables with `cmp`
 * Special variables used by `sort` : `$a` and `$b`

---

```perl
my @arr = (1, 10, 2, 43, 100);
my @arr_increase = sort {$a <=> $b} @arr;
my @arr_decrease = sort {$b <=> $a} @arr;
```

---

## Iteration / Loops

 * Loop until condition is met, with `while (CONDITION)`
 * Loop using a counter, with `for (INITIAL,CONDITION,INCREMENT)`
 * Loop across an array with `foreach my $element (@array)`

## Reading and writing files

Standard streams in Unix/Linux: `STDIN`, `STDOUT`, `STDERR`.

 * Open file and associate with filehandle with `open`
 * Reading mode:
    * Read file line-by-line with `while` loop and angle-brackets
    * Strip newline character with `chomp`
    * Current line is accessed with special variable `$_`
 * Writing mode:
    * Write to filehandle with `print`
 * Halt and report errors with `die` and `$!`

Example:

---

```perl
open (my $filehandle, "<", $filename) or die ("$!"); # Read
while (<$filehandle>) {
  chomp;
  my $current_line = $_;
}
close(my $filehandle); # Close file
```

---
