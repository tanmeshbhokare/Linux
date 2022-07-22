# Scenario

# There was some users data copied on Nautilus App Server 3 at /home/usersdata location by the Nautilus production support team in Stratos DC. 
# Later they found that they mistakenly mixed up different user data there. Now they want to filter out some user data and copy it to another location.
# Find the details below:
# On App Server 3 find all files (not directories) owned by user yousuf inside /home/usersdata directory 
# and copy them all while keeping the folder structure (preserve the directories path) to /media directory.

#Solution

# Step 1 - Find all files with username yosuf and copy them to /media, but it will copy /home/usersdata/* as well
find /home/usersdata/* -user yousuf | cpio -pdm /media

# Step 2 - go to destination directory
cd /media/home/usersdata

# Step 3 - move all files to /media/
mv * ../../

# Step 4 - change directory to /media
cd ../../

# Step 5 - delete /home directory
rm -rf /home/
