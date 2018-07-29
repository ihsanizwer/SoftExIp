#!/bin/bash
clear
cat header
echo ""
echo "______________________________________________________________________________"
echo ""
echo "This is a simple script that will find excluded IP based logs from a given log"
echo "______________________________________________________________________________"
echo ""
echo "Author: Ihsan                                              Version: 2.0"
echo "______________________________________________________________________________"
echo ""

echo "Enter the name of the log file to analyze: "
read log
echo "Analysis in progress.."

declare -a iplist
declare -a temparr

while read IP
do
	iplist+=($IP)
	done < ./softexip.cfg

if [ -f tempfile.txt ];then
	rm tempfile.txt
fi

for exip in "${iplist[@]}"
do
	echo "Analyzing for IP: ${exip}"
	#cat ${log} | grep ${exip} > $"exip".txt
	cat ${log} | grep ${exip} >> tempfile.txt

	done

#numlines=`cat ${log} | wc -l`

#for ((record=1;record<=numlines;record++))
#do
#	for exip in "${iplist[@]}"
#	do
#		check=`sed -n ${record}p ${log} | grep ${exip} | wc -l`
#			if [ ${check} -eq 1 ];then
#				sed -n ${record}p ${log} >> targetrecords.txt
#				break
#			fi
#		done
#	done


#while read record
#do
#	for exip in "${iplist[@]}"
#	do
#		echo $record | grep ${exip} >> targetrecords.txt
#	done
#	done < $log

if [ -f exclIp.csv ];then
		rm exclIp.csv
	fi

while read line 
do
	#echo $line
	temparr=`echo $line` 
	csvrecord=""
	for field in $temparr
	do
		csvrecord=$csvrecord,${field}
		done
		echo ${csvrecord} >> exclIp.csv
	done <./tempfile.txt

echo ""
echo "Process Complete! Results saved in exclIp.csv"