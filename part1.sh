#!/bin/bash

# Name: Biki Gurung
# Description: Create a new User and add Git Commands of the user using script
# Version: 1.0
# Date : 08/15/2022
# Errors: 

echo "What is your Full Name"
read userFullName

echo "What is the Password for the user"
read userPwd

echo "What is your Firstname / the first letter of your first Name"
read firstChar

echo "what is your Lastname"
read lastName

userName=${firstChar:0:1}$lastName
echo $userName

sudo useradd -m -p "$userPwd" "$userName"
echo "$userName has been added"

sudo groupadd GitAcc
echo "New UserGroup $userGroup Created"

sudo usermod -aG GitAcc $userName
echo " $userName added to the GitAcc Group"

echo "Switching to $userName"
sudo su -p $userName

#below will check if git has been initazlied
if ! git rev-parse --is-inside-work-tree
	then
	echo "git not initalized, doing git init first."
	git init
fi


echo "Please enter Username for Git Config"
read gitUserName

echo "Please enter User Email for Git Config"
read gitEmail
 

git config user.name $gitUserName
git config user.email $gitEmail

echo "Please enter the ssh address to the Remote Repo: for git clone"
read gitRemoteAddress

git clone $gitRemoteAddress


exit 0

