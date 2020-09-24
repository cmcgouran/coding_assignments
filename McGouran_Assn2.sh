#! /bin/bash


#create child script.
	touch child_script.sh

#create output file.
	echo "touch output.txt"  >>  child_script.sh

#copy header to output file. Echo into child script.
	echo "cut -f1,2,4 BTS_data.txt | head -n1 > output.txt"  >>  child_script.sh

#use loop to get data from BTS_data.txt and append to output file, echo into the child_script. 
echo	"for littledudes in [1-8]
do
	grep -E 13BTS0$littledudes BTS_data.txt >> reversetrap

done"  >>  child_script.sh

#sort the and cut into output file.
echo	"sort -k4 -rg reversetrap | cut -f1,2,4  >> output.txt"  >> child_script.sh

#create zip file of output. 
echo	"zip output.gz output.txt"  >> child_script.sh

#remove the reverstrap file.
echo	"rm reversetrap" >> child_script.sh

#make child script exc. 
	chmod u+x child_script.sh

#exc. child_script.
	./child_script.sh


