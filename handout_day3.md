# Handout Day 3

## Subroutines

 * Define subroutines (functions) with `sub`
 * Inputs are in special array variable `@_`
 * Arrays and hashes must be passed as references
 * Specify output of subroutine with `return`

---
```perl
print power(5,2);

sub power {
  my ($number, $exp) = @_;
  my $output = $number ** $exp;
  return $output;
}
```
---

## Running external programs

 * Capture output with backticks: `

---
```perl
my $UTC_date = `date -u`;
```
---

 * Capture exit status with `system`

---
```perl
my $exit = system("ls *.file");
if ($exit != 0) {
  print STDERR "The command did not exit successfully\n";
}
```
---
