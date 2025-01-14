| iRedMail version compatibility  | 1.6.0 |
| ------------- | ------------- |

Administrative scripts for iRedMail, useful if you do not use iRedAdmin, or you do not have iRedAdmin Pro.

Read the examples and usage in each script to understand the parameters to use. Each script will generate SQL for you to use. These scripts are for a iRedMail installation with an SQL back end, specifically PostgreSQL.

There are scripts so far to do the following administrative functions:

| Category      | Script                              | What it does                                                                                                                                |
| ------------- | ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| User accounts |                                     |                                                                                                                                             |
|               | create-new-user.sh                  | Creates a new user, with an optional feature of created users being a part of default aliases												|
|               | create-new-user-bulk.sh             | Creates new users from a CSV file, with an optional feature of created users being a part of default aliases								|
|				| add-domain-admin.sh				  | Makes an existing user into a domain admin, optionally can become a global admin - read the prompt										    |																							|
|				| revoke-domain-admin.sh			  | Revokes a users domain administrator permission																								|
|				| remove-domain-admin.sh			  | Remove a users entry entirely from the domain_admins table																					|
|               | remove-user.sh                      | Delete a user                                                                                                                               |
|               | update-account-password.sh          | Update a users password                                                                                                                     |
|               | update-account-password-bulk.sh             | Update password to users from a CSV file								|
|               | disable-user.sh                     | De-activate a user account                                                                                                                  |
|               | enable-user.sh                      | Re-enables a disabled user account                                                                                                          |
|               | list-active-accounts.sh             | List active user accounts                                                                                                                   |
|               | list-inactive-accounts.sh           | List inactive user accounts                                                                                                                 |
|               | list-all-but-regular-accounts.sh    | Lists all from the forwardings table that are not just regular accounts                                                                     |
|               | enable-pop3-for-user.sh             | Enables pop3 for a user account, enables usage of this protocol                                                                             |
|               | enable-pop3-for-domain.sh           | Enables pop3 for all accounts on a given domain                                                                                             |
|               | enable-imap-for-user.sh             | Enables IMAP for a user account, enables usage of this protocol                                                                             |
|               | disable-pop3-for-user.sh            | Disables pop3 for a user account, prevents usage of this protocol                                                                           |
|               | disable-pop3-for-domain.sh          | Disables pop3 for all accounts on a given domain                                                                                            |
|               | disable-imap-for-user.sh            | Disables IMAP for a user account, prevents usage of this protocol                                                                           |
|               | increase-mailbox-quota.sh           | Increases the mail box quota size for a given user																							|
|               | increase-all-mailbox-quota.sh       | Increases the mail box quota size for all users regardless of domain, or for a specific domain                                              |
| Aliases       |                                     |                                                                                                                                             |
|               | create-alias.sh                     | Create an alias                                                                                                                             |
|               | add-user-to-alias.sh                | Add a user to an alias. Multiple users can be added to the same alias, use the script as many times as necessary.                           |
|               | create-alias-policy.sh              | Creates or updates an access policy for an alias to restrict which senders are allowed to send email to this mail alias                     |
|               | remove-alias.sh                     | Remove a given alias                                                                                                                        |
|               | set-alias-active.sh                 | Set an alias as active                                                                                                                      |
|               | set-alias-inactive.sh               | Set an alias as inactive                                                                                                                    |
|               | is-address-an-alias.sh              | Check if a given email address is an alias                                                                                                  |
|               | add-alias-domain.sh                 | Add an alias domain                                                                                                                         |
|               | remove-alias-domain.sh              | Remove an alias domain                                                                                                                      |
| Forwarding    |                                     |                                                                                                                                             |
|               | list-forwarding.sh                  | List any configured forwards                                                                                                                |
|               | remove-forwarding.sh                | Deletes mail forwarding from a given address to another entered address                                                                     |
|				| remove-whole-forward.sh			  | Removes the whole forwarding address and all forwards associated to it																		|
|               | add-mail-forward.sh                 | Forward mail from one user account to another                                                                                               |
|               | is-forward-to.sh                    | List if any addresses are set to forward to a given address                                                                                 |
|               | is-forward-from.sh                  | List if any addresses are set to forward fromm a given address                                                                              |
|               | disable-mail-forwarding.sh          | Disables mail forwarding from a given address to another entered address, but do not delete the configured forward                          |
| Domain        |                                     |                                                                                                                                             |
|               | add-domain.sh                       | Creates a new domain in the database, after which you can begin creating user accounts in the new domain                                    |
|               | change-domain.sh                    | Change domain name of an existing domain and associated mail accounts																		|
|               | remove-domain.sh                    | Removes a domain from the database																											|
|               | update-domain-quota.sh              | Updates the domain wide mailbox quota																										|
|               | update-all-domain-quota.sh          | Updates all existing domains with a new default mailbox quota                                                                               |
|               | enable-domain.sh                    | Enables a domain in the database, must exist already                                                                                        |
|               | disable-domain.sh                   | Disables a domain in the database                                                                                                           |
| Misc          |                                     |                                                                                                                                             |
|               | list-top-10-mailbox.sh              | List the top 10 mailboxes by size                                                                                                           |
|               | list-largest-to-smallest-mailbox.sh | List mailbox size from largest to smallest                                                                                                  |
|               | update-storagenode.sh               | Mail is located at /var/vmail/vmail1 by default, this script helps change the database value of 'vmail1' to a new value                     |
|               | update-storagebasedirectory.sh      | The base directory for mail is located at /var/vmail by default, this script helps change the database value of '/var/vmail' to a new value |

