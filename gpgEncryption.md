## Problem Statement

We have confidential data that needs to be transferred to a remote location, so we need to encrypt that data.We also need to decrypt data we received from a remote location in order to understand its content.

On storage server in Datacenter we have private and public keys stored `/home/*_key.asc`. Use those keys to perform the following actions.

Encrypt `/home/encrypt_me.txt` to `/home/encrypted_me.asc`.

Decrypt `/home/decrypt_me.asc` to `/home/decrypted_me.txt`. (Passphrase for decryption and encryption is tanmesh).

## Solution

#### Step 1 : SSH to storage server

`ssh user@storageserver`

#### Step 2 : encrypt with passphrase

`sudo gpg --output encrypted_me.asc -c encrypt_me.txt`

#### Step 3 : decrypt with passphrase

`sudo gpg --output decrypted_me.txt --decrypt decrypt_me.asc`

