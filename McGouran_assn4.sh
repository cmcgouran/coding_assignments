#! /bin/bash

#USE AWK COMMAND AND IF/ELSE STATEMENT TO ADD ADDITIONAL COLUMN WITH CONDITION OF AGE TO THE FILE.

awk 'NR==1 {$0=$0 OFS "Eligibility"; print; next } 
{
if ($2 >= 18) 
$(NF+1)="eligible"
else 
$(NF+1)="naw"
} 1' possible_voters.txt >> results.txt

#ECHO FIRST 10 LINES/LAST 10 LINES. 

head -n 10  results.txt
tail -n 10 results.txt

#DISPLAY HOW MANY ELIGIBLE VOTERS THERE ARE.

grep -o  'eligible' results.txt | wc -l

