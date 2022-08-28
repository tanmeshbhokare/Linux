## Problem Statement

During a routine security audit, the team identified an issue on the App Server. Some malicious content was identified within the website code. After digging into the issue they found that there might be more infected files. Before doing a cleanup they would like to find all similar files and copy them to a safe location for further investigation. Accomplish the task as per the following requirements:

a. On App Server at location `/var/www/html/news` find out all files (not directories) having `.css` extension.

b. Copy all those files along with their parent directory structure to location `/news` on same server.

c. Please make sure not to copy the entire `/var/www/html/news` directory content.

## Solution

#### Step 1 : SSH to App Server

`ssh user@appserver`

#### Step 2 : Find and copy `.css` files to `/news` directory 

`find /var/www/html/news/ -name *.css | sudo cpio -pdm /news`

#### Step 3 : Verify `/news` directory has only `.css` files

`find /news/ * | grep -v .css`

