# Sorting

Brandon Seah

Perl Course 2017

---

## What can be sorted?

> - Lists / arrays of numbers

---

## Array of numbers

```perl
my @numbers = (12, 4, 66, 7, 23, 5, 19);
print join ",", @numbers; # Print comma-separated list
print "\n";
```

Sort numerically vs. sort as characters

---

## Syntax for `sort`

```perl
my @numbers = (12, 4, 66, 7, 23, 5, 19);
my @sort1 = sort {$a <=> $b} @numbers;
print join ",", @numbers;
print "\n";
```

> - `sort SUBROUTINE ARRAY` (no comma)
> - Special variables `$a` and `$b`
> - How to sort descending?

---

## Sort ascending vs descending

```perl
my @numbers = (12, 4, 66, 7, 23, 5, 19);
my @sort1 = sort {$a <=> $b} @numbers;
my @sort2 = sort {$b <=> $a} @numbers;
print join ",", @sort1;
print join ",", @sort2;
```

---

## What's the difference?

```perl
my @numbers = (12, 4, 66, 7, 23, 5, 19);
my @sort1 = sort {$a <=> $b} @numbers;
my @sortA = sort {$a cmp $b} @numbers;
print join ",", @sort1;
print join ",", @sortA;
```

---

## What can be sorted?

> - Lists / arrays of numbers
> - Lists / arrays of character strings

---

## Sorting character strings

```perl
my @names = ("Leonardo", "Donatello", "Raphael", "Michaelangelo");
my @sortA = sort {$a cmp $b} @names;
my @sortB = sort {$b cmp $a} @names;
print join ",", @sortA;
print join ",", @sortB;
```

---

## Sorting tables

Turtle           Pizza
-------         ------
Leonardo        Anchovies
Donatello       Tuna
Raphael         Pepperoni
Michaelangelo   Cheese

*What kind of data structure should I use?*

---

## Sorting hashes

```perl
my %tp = ("Leonardo" => "Anchovies",
          "Donatello" => "Tuna",
          "Raphael" => "Pepperoni",
          "Michaelangelo" => "Cheese");
```

<small>File `hash_template.pl`</small>

Which is the key, which is the value?

---

## Review: Getting keys of a hash

Getting keys of a hash

```perl
my %tp = ("Leonardo" => "Anchovies",
          "Donatello" => "Tuna",
          "Raphael" => "Pepperoni",
          "Michaelangelo" => "Cheese");
print join ",", (keys %tp);
```

 * What kind of variable is `(keys %tp)`?
 * What order are they reported? (Try running a few times)

---

## Review: Getting values of a hash

You tell me....

---

## Sort values by keys

> - Get the keys
> - Sort the keys
> - For each key...
> - Report the value

---

## Sort values by keys

```perl
my %tp = ... # etc
foreach my $key (sort {$a cmp $b} keys %tp) {
  print $tp{$keys};
  print ",";
}
```

Identify the steps

---

## Sort keys by values

```perl
my %tp = ... # etc
foreach my $key (sort {$tp{$a} cmp $tp{$b}} keys %tp) {
  print $key
}
```

 * Keys guaranteed to be unique
 * Values are not

---

## What can be sorted? (Summary)

> - Lists / arrays of numbers
> - Lists / arrays of character strings
> - Hashes by keys
> - Hashes by values
