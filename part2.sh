#!/bin/bash

echo "Verifying your git config file"
cat .git/config

echo "creating a new file"
touch newfile.txt

echo "this is biki" | cat  >>  newfile.txt

#git status

git add .

echo "Please enter git Commit Message"
read gitMessage

git commit -m "$gitMessage"

#git log

## Checking if the files contatins sensitive information
## i.e Phone no before pushing the file to the Git Remote

#filePath = pwd

flag = 'true'

echo "Checking the file"

while IFS='' read -r line || [[ -n $line ]]
do
    if [[ "$line" =~ ^[0-9]{3}-[0-9]{3}-[0-9]{4}$|^\([0-9]{3}\)\ [0-9]{3}-[0-9]{4}$|^[0-9]{9}$ ]]
    then
        echo "$line"
	$flag = 'false'
    fi
done <newfile.txt

if $flag == 'true'; then
	echo "flag is clear"
	git push --all
else
	echo "sensitive Data found ! please remove the data from the files and add try to push again."
fi

exit 0

