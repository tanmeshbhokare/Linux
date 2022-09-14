## Problem Statement

The production support team of xCorp Industries is working on developing some bash scripts to automate different day to day tasks. 
One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Datacenter, and they need to create a bash script named `news_backup.sh` which should accomplish the following tasks. (Also remember to place the script under `/scripts` directory on App Server 3)


a. Create a zip archive named xcorp_news.zip of /var/www/html/news directory.

b. Save the archive in /backup/ on App Server 3. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Backup Server.

c. Copy the created archive to Backup Server server in /backup/ location.

d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, userx in case of App Server 1) must be able to run it.


## Solution

#### Step 1: SSH to App Server 3

```
ssh user@appserver03
```

#### Step 2: Enable passwordless SSH to backup server

```
[user@appserver03]$ ssh-keygen`

[user@appserver03]$ ssh-copy-id -i userx@bkpserver01
```

#### Step 3: Write a bash script for backup 

```
[user@appserver03 scripts]$ cat news_backup.sh 
#!/bin/bash

zip /backup/xcorp_news.zip /var/www/html/news

chmod 777 /backup/xcorp_news.zip

scp /backup/xcorp_news.zip user@bkpserver01:/backup/xcorp_news.zip

```

