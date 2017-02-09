# Calling external commands

Brandon Seah

Perl Course 2017

---

## Wait, Perl doesn't do *everything*?

> - Scripting language
> - Feed input to other programs ...
> - ... and process their output

---

## Bash is a scripting language

```bash
for FILE in *.fasta
do
COUNT=$(grep '>' $FILE | wc)
echo "File: $FILE"
echo "Headers: $COUNT"
done
```

Why not just use Bash?

---

## Two choices

> - Capture STDOUT
>  - Backticks
> - Don't capture STDOUT
>  - `system()`

---

## Method 1 - Backticks

```perl
my $run_ls = `ls`;
```

> - Captures STDOUT of command (Why?)

---

## Where is the backtick?

![](US_keyboard.png)

<small>[CC BY-SA 3.0](https://commons.wikimedia.org/w/index.php?curid=11391326)</small>

---

## Where is the backtick?

![](DE_keyboard.png)

<small>[CC BY-SA 3.0](https://commons.wikimedia.org/w/index.php?curid=1058095)</small>

---

## Capture STDOUT

```perl
my $ls_output = `ls`;
print $ls_output;
```

Multiple lines "slurped" into a string

How can we separate?

---

## Convert captured output to array

```perl
my $ls_output = `ls`;
my @ls_split = split "\n", $ls_output;
print $ls_split[0];
print "\n";
print $ls_split[1];
print "\n";
```

---

## STDERR is not captured

```perl
my $ls_output = `ls nonexistent_file`;
```

---

## What if the command fails?

```perl
my $failure = `caringtoomuch`;
```

What happens?

---

## What if the command fails?

```perl
use warnings;
my $failure = `caringtoomuch`;
```

Now what happens?

---

## Method 2 - `system()`

```perl
my $run_ls = system("ls");
```

> - Doesn't capture STDOUT (Why not?)
> - Returns *exit status*

---

## Exit status

> - 0 - success!
> - Non-0 - not success!

---

## Exit status example

```perl
my $status1 = system("ls");
my $status2 = system("ls nonexistentfile");
my $status3 = system("nonexistentcommand");
print "First exit status: $status1\n";
print "Second exit status: $status2\n";
print "Third exit status: $status3\n";
```

---

## Things to note

 * Script continues even if command fails
 * STDOUT and STDERR "flow through" to user

---

## Summary

**Backticks**

> - capture STDOUT

**`system`**

> - return *exit status*

*Remember*

> - Perl waits for command to finish
> - Script continues if command fails
> - `use warnings;`

---

## Exercises

 * Use `ls` and backticks to return a list of `.fasta` files in the current folders, and then open each of those files and count the number of sequences in each file. (Hints: `split`, `foreach`, Regex with `m/^>/`)
