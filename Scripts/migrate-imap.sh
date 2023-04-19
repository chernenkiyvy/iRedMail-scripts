#!/bin/bash
#
# Author: 	chernenkiyvy
# Website: 	kit.group
# Purpose: 	Bulk migrate user from IMAP server to iRedmail.
# License: 	free
#
# Run this script to bulk mirate mail user from other server.
# Example usage: bash migrate-imap.sh
#
#Example CSV file: imap.old-server.org;username@old-server.org;old-server-password;imap.localhost;username@new-server.org;new-server-password

echo Looping on account credentials found in user-to-migrate.txt
echo

{ while IFS=';' read  h1 u1 p1 h2 u2 p2 fake
    do
        { echo "$h1" | egrep "^#" ; } > /dev/null && continue # this skip commented lines in file.txt
        echo "==== Starting imapsync from host1 $h1 user1 $u1 to host2 $h2 user2 $u2 ===="
        imapsync --host1 "$h1" --user1 "$u1" --password1 "$p1" \
                    --host2 "$h2" --user2 "$u2" --password2 "$p2" \
#                    --ssl1 \
#                    --port1 993 \
                    --folderfirst INBOX \
                    --regextrans2 "s/&BB4EQgQ,BEAEMAQyBDsENQQ9BD0ESwQ1-/Sent/" \
                    --regextrans2 "s/&BBoEPgRABDcEOAQ9BDA-/Trash/" \
                    --regextrans2 "s/&BCEEPwQwBDw-/Junk/" \
                    --regextrans2 "s/&BCcENQRABD0EPgQyBDgEOgQ4-/Drafts/" \
                    --regexflag 's/\\Unseen//g' \
                    --useheader Message-Id
                 "$@"
        echo "==== Ended imapsync from host1 $h1 user1 $u1 to host2 $h2 user2 $u2 ===="
        echo
    done
} < user-to-migrate.txt

