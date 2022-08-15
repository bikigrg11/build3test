#!/bin/bash

echo "Verifying your git config file"
cat .git/config

echo "---------------------------"
echo "creating a new file"
touch newfile.txt


echo "this is biki" | cat  >>  newfile.txt

git status

echo "-----------------------------"
git add .

echo "Please enter git Commit Message"
read gitMessage

git commit -m "$gitMessage"

echo "-----------------------------"
#git log

## Checking if the files contatins sensitive information
## i.e Phone no before pushing the file to the Git Remote

flag="true"

echo "Checking the file"
echo "---------------------------"

while IFS='' read -r line || [[ -n $line ]]
do
    if [[ "$line" =~ ^[0-9]{3}-[0-9]{3}-[0-9]{4}$|^\([0-9]{3}\)\ [0-9]{3}-[0-9]{4}$|^[0-9]{9}$ ]]
    then
        echo "$line"
	flag="false"
    fi
done <newfile.txt

echo "---------------------------"

if [ $flag == "true" ]
	then
	echo "flag is clear"
	git push --all
else
	echo "sensitive Data found ! please remove the data from the files and add try to push again."
fi

exit 0

