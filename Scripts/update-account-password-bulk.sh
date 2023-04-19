#!/bin/bash
#
# Author: 	chernenkiyvy
# Website: 	kit.group
# Purpose: 	Bulk updates the password for a user account in iRedmail.
# License: 	2-clause BSD license
#
# Run this script to generate SQL command used to bulk password user. Note run this script from the directory where generate_password_hash.py is.
# Example usage: bash update-account-password-bulk.sh user_update_password.csv > update-account-password-bulk.sql
#.
# This will print SQL commands on the console directly and also it will save a SQL output file named.
# update-account-password-bulk.sql in the scripts present directory.
#
# Import update-account-password-bulk.sql into SQL database like below:
#
# mysql -uroot -p
# mysql> USE vmail;
# mysql> SOURCE /path/to/update-account-password-bulk.sql;
#
# psql -U vmailadmin -d vmail
# sql> \i /path/to/update-account-password-bulk.sql;

# Password scheme. Available schemes: BCRYPT, SSHA512, SSHA, MD5, NTLM, PLAIN.
# Check file Available
PASSWORD_SCHEME='PLAIN'

if [ "$1" == "-h" ] || [ "$1" == "--h" ] || [ "$1" == "/h" ] || [ $# -ne 1 ]; then
	printf "Purpose: Updates the password for a user account in iRedmail. \n"
	printf "Note: You can also use this script to change hashing algorithms. If you made an account with SHA512 but actually wanted bcrypt you can change that by updating the password."
	printf "Note: Default password scheme is SSHA512, enter a different scheme as the third parameter if you wish to override. Available schemes: BCRYPT, SSHA512, SSHA, MD5, NTLM, PLAIN. \n"
	printf "Usage: bash update-account-password.sh jeff@example.com Password123 \n"
	exit 0
fi

count=1
while read csv; do
    address=$(head -n "$count" "$1" | tail -n 1 | awk -F "\"*,\"*" '{print $1}')
    full_name=$(head -n "$count" "$1" | tail -n 1 | awk -F "\"*,\"*" '{print $2}')
    plain_password=$(head -n "$count" "$1" | tail -n 1 | awk -F "\"*,\"*" '{print $3}')
    


# Crypt the password given in $2
export CRYPT_PASSWD="$(python ./generate_password_hash.py ${PASSWORD_SCHEME} ${plain_password})"

printf "UPDATE mailbox SET password = '${CRYPT_PASSWD}', passwordlastchange = NOW() WHERE username = '$address';\n"
    count=`expr $count + 1`
done < "$1"

