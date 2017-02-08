#!/bin/bash

for i in presentation_*.md
do
j=${i%%.md}
pandoc -w revealjs \
  -V theme=solarized \
  -V transition=fade \
  -s \
  -o $j.html \
  $i
#sed -i 's/reveal.min/reveal/' $j.html # There is a bug in the minimized versions!
#sed -i 's/simple.css/solarized.css/' $j.html
done
