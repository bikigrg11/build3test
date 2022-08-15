#!/bin/bash

echo "Verifying your git config file"
cat .git/config


echo "creating a new file"

touch newfile.txt

echo "this is biki" | cat  >>  newfile.txt

git status

git add .

echo "Please enter git Commit Message"
read gitMessage

git commit -m "$gitMessage"

git log

exit 0

