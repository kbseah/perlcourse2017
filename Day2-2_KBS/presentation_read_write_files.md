# Reading and Writing

Brandon Seah

Perl Course 2017

---

## Review: Standard Streams

Unix is a [series of tubes](https://en.wikipedia.org/wiki/Series_of_tubes)

 * `STDIN`
 * `STDOUT`
 * `STDERR`

---

## Review: Standard Streams

**This is in the `bash` shell**

```bash
ls | less # Redirect STDOUT to another program
ls > list_of_files # ... to a file
man foobar 2> error_message # Redirect STDERR
cat error_message # Write file to STDOUT
```

---

## `print` to STDOUT & STDERR

Perl writes to STDOUT by default

```perl
print "Hello world!\n";
print STDOUT "Hello world!\n"; # Same thing
```

What about STDERR?

---

## `print` to STDOUT & STDERR

Good guess...

```perl
print STDERR "Goodbye world...\n";
```

Useful for error messages

---

## Opening a file

Perl needs to know three things

> - Where is the file? (*path*)
> - Open for reading, writing, or appending? (*mode*)
> - What's the alias for the stream? (*filehandle*)

---

## Opening a file

```perl
my $filename = "example.txt";

open (my $output, ">", $filename);
print $output "Hello world!\n";
print $output "Hello world again!\n";
close($output);
```

Identify the *path*, *mode*, and *filehandle*

---

## Writing vs Appending

```perl
open ($output, ">", $filename);
```

vs.

```perl
open ($output, ">>", $filename);
```

---

## Reading a file

Try this:

```perl
my $input_file = "example.txt" # Output from earlier

open (my $input, "<", $input_file);
print $input;
close($input);
```

---

## Perl reads lines by default

```perl
my $input_file = "example.txt";

open (my $input, "<", $input_file);
my $line = <$input>;
print $line;
close ($input);
```

---

## Looping across a file

```perl
my $input_file = "example.txt";
my $counter = 0; # Counter for lines
open (my $input, "<", $input_file);
while (<$input>) {
    $counter++;
    print "line $counter is:\n";
    print $_;
}
close ($input);
```

---

## `chomp`

```perl
my $input_file = "example.txt";
my $counter = 0; # Counter for lines
open (my $input, "<", $input_file);
while (<$input>) {
    chomp;
    $counter++;
    print "line $counter is:\n";
    print $_;
}
close ($input);
```

---

## What if the file isn't there?

```perl
my $input_file = "nonexistent.txt";
open (my $input, "<", $input_file);
close ($input);
```

---

## Error messages

```perl
my $input_file = "nonexistent.txt";
open (my $input, "<", $input_file) or die;
close ($input);
```

---

## Error messages

```perl
my $input_file = "nonexistent.txt";
open (my $input, "<", $input_file) or die ("$!");
close ($input);
```
What is reported by `$!`?

---

## Error messages

```perl
my $input_file = "nonexistent.txt";
open (my $input, "<", $input_file) or die ("Can't find $input: $!");
close ($input);
```
This should be more informative

---

## Tasks

 * Read a Fasta file and extract only the header lines (Hint: Regex)
 * Read a Fasta file, extract header lines, write a tab-separated table of Genbank accession number (column 1) and description (column 2)

---

## Task 1 - Headers of a Fasta file

 * Fasta files have a *delimiter* for header lines

```
>sequence001
ATGGCTATACTACTGACTGACTGACCCACATGCTTTAGTCACTACTGTT
ATCGTCTTAAACTTTTGTGCATCTTATCTATGCGTCTCTACGTGTAGTC
ATCGATGCTACATCGTAGCTGAT
>sequence002
ACTCGTAGTCTACNTAGTCGTGATCGATCNTGCTAGTCTATTTCTATCG
...
```

---

## Task 1 - Headers of a Fasta file

> - Open file to stream with `open`
> - Iterate over the lines of the file with `while`
> - Check for matches with `if` and regex (`m//`)
> - Close the stream

---

## Task 1 - Headers of a Fasta file

```perl
my $file = "sequences.fasta";
open (my $input, "<", $file);
while (<$input>) {
  chomp;
  if (m/^>/) {
    print $_;
  }
}
close($input);
```
Quiz: What does `^` mean in the RegEx?

---

## Task 2 - Make a table from Genbank headers

```
>NR_117372.1 Reinekea aestuarii strain IMCC 4489 16S ribosomal RNA gene, partial sequence
```

---

## Task 2 - Make a table from Genbank headers

```
>NR_117372.1 Reinekea aestuarii strain IMCC 4489 16S ribosomal RNA gene, partial sequence
```

```perl
if ($line =~ m/^>(\w+\.\w+) (.*)/) {
  my $accession = $1;
  my $description = $2;
}
```
