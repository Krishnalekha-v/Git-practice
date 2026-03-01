#!/bin/bash

source_dir=/home/ec2-user/logs
r="\e[31m"
g="\e[32m"
n="\e[0m"

if [ -d $source_dir ]
then
echo -e "$souce_dir $g Exists $n"
elso
echo -e "$source_dir $r Does not exists $n"
exit 1
fi
FILES=$(find ${source_dir} -name "*.log" -mtime +14)
echo "FILES: $FILES"
while IFS=read -r file
do
echo "Deleting files: $file"
rm -rf $file
done <<<$FILES