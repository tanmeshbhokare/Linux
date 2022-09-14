## Problem Statement

The production support team of xCorp Industries is working on developing some bash scripts to automate different day to day tasks. 
One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Datacenter, and they need to create a bash script named `news_backup.sh` which should accomplish the following tasks. (Also remember to place the script under `/scripts` directory on App Server 3)


a. Create a zip archive named xfusioncorp_news.zip of /var/www/html/news directory.

b. Save the archive in /backup/ on App Server 3. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.

c. Copy the created archive to Nautilus Backup Server server in /backup/ location.

d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.


## Solution

@stapp03 scripts]$ history
    1  ls
    2  ls /backup/
    3  ls /var/www/html/news/
    4  cd /scripts/
    5  ls
    6  vi news_backup.sh
    7  sudo vi news_backup.sh
    8  ls
    9  zip 
   10  zip /var/www/html/news news.zip
   11  zip /var/www/html/news -n news.zip
   12  l
   13  zip -b /var/www/html/news -n news.zip
   14  zip -b /var/www/html/news news.zip
   15  man zip
   16  zip news.zip /var/www/html/news
   17  ls
   18  rm news.zip 
   19  ls
   20  zip xfusioncorp_news.zip /var/www/html/news
   21  ls
   22  sudo vi news_backup.sh 
   23  ls
   24  ls /backup/
   25  zip /backup/xfusioncorp_news.zip /var/www/html/news
   26  ls /backup/
   27  rm xfusioncorp_news.zip 
   28  rm /backup/xfusioncorp_news.zip 
   29  ls /backup/
   30  sudo vi news_backup.sh 
   31  rsync
   32  scp
   33  scp clint@stbkp01
   34  ssh clint@stbkp01
   35  scp /backup/xfusioncorp_news.zip clint@stbkp01:/backup/
   36  ssh_keygen
   37  ssh
   38  ssh-keygen 
   39  ssh-copy-id -i clint@stbkp01
   40  ssh clint@stbkp01
   41  ssh-copy-id -i clint@stbkp01
   42  exit
   43  ssh clint@stbkp01
   44  ls /backup/
   45  ls -l/backup/
   46  ls -l /backup/
   47  ls -l
   48  ls -l /
   49  cd /backup/
   50  ll
   51  ls -lrt
   52  ls -lrta
   53  cd
   54  cd /scripts/
   55  ls
   56  ls -lrta
   57  chmod 777 news_backup.sh 
   58  sudo chmod 777 news_backup.sh 
   59  ls -lrta
   60  su tony
   61  sudo vi news_backup.sh 
   62  scp /backup/xfusioncorp_news.zip clint@stbkp01:/backup/
   63  sudo vi news_backup.sh 
   64  ls
   65  sh news_backup.sh 
   66  history
[banner@stapp03 scripts]$ 


```
[banner@stapp03 scripts]$ cat news_backup.sh 
#!/bin/bash

zip /backup/xfusioncorp_news.zip /var/www/html/news

chmod 777 /backup/xfusioncorp_news.zip

scp /backup/xfusioncorp_news.zip clint@stbkp01:/backup/xfusioncorp_news.zip

[banner@stapp03 scripts]$ 
```
