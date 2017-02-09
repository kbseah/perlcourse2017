# Loops!

Brandon Seah

Perl Course 2017

---

## Iteration $\neq$ Recursion

> - Iteration - Repeating an action
> - Recursion - Including a function inside its own definition

---

### Recursion example

```perl
sub factorial_recurse {
    my ($N) = @_;
    if ( $N == 0 ) {
        return 1;
    } else {
        return $N * factorial_recurse($N-1);
    }
}
```

Can rapidly eat up a lot of memory!

---

## How to iterate?

> - Use a counter
> - Over an array

---

## How do I love thee?

>| <small>How do I love thee? Let me count the ways.</small>
>| <small>I love thee to the depth and breadth and height</small>
>| <small>My soul can reach, when feeling out of sight</small>
>| <small>For the ends of being and ideal grace. ... </small>
>|
>|       <small>*Elizabeth Barrett Browning*</small>

---

## How do I love thee?

```perl
my @ways = ("to the depth ... my soul can reach",
           "to the level of every day's/ Most quiet need",
           "freely",
           "purely",
           "with the passion put to use/ In my old griefs",
           "with my childhood's faith, # et cetera
           );
```

<small>File: `loops_template.pl`</small>

Pop quiz: How do I count the ways?

---

## How do I love thee?

### Using `while` loop

```perl
my @ways = ...; # From above
my $i = 0; # Initialize counter
while ($i < scalar(@ways)) {
   print "I love thee ". $ways[$i]."\n";
   $i++;
}
```

Over the **index** of an array

---

## Three things a counter needs

> - Initialize (Where to start?)
> - Stop condition (When to stop?)
> - Increment (How much per step?)

---

## How do I love thee?

### Using `for` loop

```perl
my @ways = ...; # From above
for (my $i=0; $i< scalar(@ways); $i++) {
    print "I love thee ". $ways[$i]."\n";
}
```

> - All three things are in one line
> - Does `$i` exist outside the loop?

---

## How do I love thee?

### Using `foreach` loop

```perl
my @ways = ... ; # From above
foreach my $current_way (@ways) {
   print "I love thee ". $current_way."\n";
}
```

> - No counters or indices! (Implicit)
> - Does `$current_way` exist outside the loop?

---

## `for` vs `foreach`

No difference!

But `foreach` sounds like English

---

## All together


```perl
my @ways = ...; # From above
my $i = 0; # Initialize counter
while ($i < scalar(@ways)) {
   print "I love thee ". $ways[$i]."\n";
   $i++;
}

for (my $j=0; $j< scalar(@ways); $j++) {
    print "I love thee ". $ways[$j]."\n";
}

foreach my $current_way (@ways) {
   print "I love thee ". $currentWay."\n";
}
```

---

## Review

> - Iteration with and without counter
> - *Scope* of variable in loop
> - `foreach` is easier for arrays

---

## Exercises

First make array of integers from 1 to 10:

```perl
my @integers = 1..10;
```

Use `while`, `for`, and `foreach` to do the following:

 * Return the square of each integer
 * Return the running sum
 * Return the running product (i.e. factorial series)
