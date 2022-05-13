#!/bin/bash
i=0
cp input backup_input #backups your input data
process_wget()
{
while read -r line
do
wget --no-check-certificate --limit-rate=2500k "$line"
sed -i '1d' input
./rename.sh
i=0
done<input
}

total_line=`wc -l input | awk '{ print $1}'`
until [ $i -gt $total_line ]
do
i=$((i+1))
process_wget
done
exit 0
