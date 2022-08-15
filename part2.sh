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

while IFS='' read -r line || [[ -n $line ]]
do
    if [[ "$line" =~ ^[0-9]{3}-[0-9]{3}-[0-9]{4}$|^\([0-9]{3}\)\ [0-9]{3}-[0-9]{4}$ ]]
    then
        echo "$line"
    fi
done < /


#git push --all

exit 0

