#! /bin/bash


#CREATE A FILE THAT CONTAINS JUST THE UNIQUE ID (DUPLICATE NAMES REMOVED) NAMES FOR THE COLLECTED SNAKE SAMPLES, NAMED snakeID.txt

cut -c 1-8 BTS_data.txt  > snakeID.txt
sed '1d' snakeID.txt > tmpfile; mv tmpfile snakeID.txt
sort -k 1 -u snakeID.txt > tmpfile; mv tmpfile snakeID.txt
wc -l snakeID.txt

#CREATE AN ARRAY OF snakeID.txt, NAMED IDarray, where each element is a unique 13BTS ID 

count=0
while read line ; do
	IDarray[$count]="$line"
	count=$((count+1))
done < snakeID.txt

#MAKE A LOOP THAT CREATES 242 FILES, SYNTAX: file_13BTS that you will use later

for i in {1..242}
do
touch file_13BTS${i}.txt
done

#CREATE A FOR-LOOP WITH ANOTHER FOR-LOOP INSIDE THAT LOOPS THROUGH BTS_data.txt FILE AND GREPS
##THE CORRESPONDING STRING (i.e. the matching lines with associated ID) | APPEND INTO A FILE THAT CORRESPONDS TO THE NUMBER OF SNAKES SAMPLED
###IDarray HAS 242 ELEMENTS AND 242 FILES WILL BE PRODUCED SO AS EACH ID LOOPS THROUGH BTS_data.txt ONLY THE SAMPLES GREPED GO INTO FILE# (1:1). 

for ID in {$IDarray[@]}
do
grep {$ID} BTS_data.txt | 
			for j in [1..242]
			do
			> file_13BTS[$j].txt
			done
done 


#MAKE A DIRECTORY NAMED Files_13BTS AND MOVE ALL OF THE FINAL FILLED FILES INTO IT

mkdir Files_13BTS
mv file_13BTS* Files_13BTS

#CD INTO DIR W/ FILES AND LIST THEM. ECHO THAT THE SCRIPT IS FINISHED. 

cd Files_13BTS
ls -lth 
echo "Done! Open up a file to see the specifics for any of the 242 snakes sampled." 
