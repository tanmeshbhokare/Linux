## Problem Statement

During a recent security audit, the application security team of xCorp Industries found security issues with the Apache web server on Nautilus App Server 2 server in DC. They have listed several security issues that need to be fixed on this server. Please apply the security settings below:

a. On App Server 2 it was identified that the Apache web server is exposing the version number. Ensure this server has the appropriate settings to hide the version number of the Apache web server.

b. There is a website hosted under `/var/www/html/beta` on App Server 2. It was detected that the directory `/beta` lists all of its contents while browsing the URL. Disable the directory browser listing in Apache config.

c. Also make sure to restart the Apache service after making the changes.

## Solution
Step 1: SSH to App server 2
```
ssh user@app_server2
```

Step 2: open `httpd.conf` for modifying

```
sudo vi /etc/httpd/conf/httpd.conf
```

Step 2.1: append the below lines in `httpd.conf` file

```
ServerTokens Prod
ServerSignature Off 
```

Step 2.2: Then find the line: `Options Indexes FollowSymLinks`

Change that line to: `Options FollowSymLinks`

Step 3: Restart the apache server

```
sudo systemctl restart httpd
```
