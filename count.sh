#!/bin/bash

sudo lvs --separator '.' | awk -F '.' '{printf "%10s \n", $4}' > lsize.tmp && awk '{if (NR>2) {print}}' lsize.tmp > lsize.txt && rm -r lsize.tmp
awk -F, '{sum=0; for (i=1; i<=NF; i++) {sum+= $i} print sum}' lsize.txt > output.txt

awk -F',' '{ sum += $1 }
           END{ printf "Total LSize: %dGB \n", sum,a NR }' output.txt > total
rm -r lsize.txt
rm -r output.txt

