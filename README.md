# SoftExIp

This is a simple script that will find excluded IP based logs from a given log.
It will output the resulting logs in to a CSV file.

Usage.

first clone this repo to your machine using the following command: git clone https://github.com/ihsanizwer/SoftExIp.git

Then give permissions to the script: chmod 755 softexip_v2.sh

Ensure that there is enough permissions to create files in the current directory. (Otherwise it will not be possible to save the result in to the csv)

Ensure you have the log file in the same directory or remember the absolute path to the log file.

Enter the list of IPs in the softexip.cfg folder. Make sure to leave the last line as it is.

Now run the script as follows: ./softexip_v2.sh

It will ask to provide log file name. Here, if the log file is in the same directory that the script exists, just enter the name of the log file. Otherwise enter the absolute location and name the log file.

The CSV file will be generated.



Warnings:
Make sure that you leave the last line of the config file softexip.cfg as it is. Make sure there are no spaces or new lines between the IPs in the config file. Make sure that there are no new lines after the comment line in the config file.