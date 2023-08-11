# Scenario

 There was some users data copied on App Server 3 at `/home/usersdata` location by the production support team in DC. 
 
 Later they found that they mistakenly mixed up different user data there. Now they want to filter out some user data and copy it to another location.
 
 Find the details below:
 
 On App Server 3 find all files (not directories) owned by user **yousuf** inside `/home/usersdata` directory and copy them all while keeping the folder structure (preserve the directories path) to `/media` directory.

# Solution

**Step 1** - From Jump server SSH to App Server 3

`ssh user@app_server3`

**Step 2** - Find all files with username yosuf and copy them to /media, but it will copy /home/usersdata/* as well

`find /home/usersdata/* -user yousuf | cpio -pdm /media`
OR
`find /home/usersdata -type f -user yousuf -exec cp -r --parents {} /media \;`

**Step 3** - go to destination directory

`cd /media/home/usersdata`

**Step 4** - move all files to /media/

`mv * ../../`

**Step 5** - change directory to /media

`cd ../../`

**Step 6** - delete /home directory

`rm -rf /home/`
