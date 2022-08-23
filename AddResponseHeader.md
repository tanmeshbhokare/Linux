## Problem Statement

We are working on hardening Apache web server on all app servers. As a part of this process we want to add some of the Apache response headers for security purpose. We are testing the settings one by one on all app servers. As per details mentioned below enable these headers for Apache:


Install `httpd` package on App Server 2 using yum and configure it to run on `3003` port, make sure to start its service.

Create an `index.html` file under Apache's default document root i.e `/var/www/html` and add below given content in it.

`Welcome to Tanmesh's Github`

Configure Apache to enable below mentioned headers:

`X-XSS-Protection` header with value `1; mode=block`

`X-Frame-Options` header with value `SAMEORIGIN`

`X-Content-Type-Options` header with value `nosniff`

Note: You can test using curl on the given app server as LBR URL will not work for this task.


## Solution

#### Step 1 : SSH to app server 2
`ssh user@appserver02`

#### Step 2 : Install httpd with yum package manager
`sudo yum install httpd -y`

#### Step 3 : Configure server to run on port 3003

`sudo vi /etc/httpd/conf/httpd.conf`

Modify `Listen 80` to `Listen 3003` in `httpd.conf` file

#### Step 4 : Configure headers

`sudo vi /etc/httpd/conf/httpd.conf`

`cat /etc/httpd/conf/httpd.conf | grep Header`

```
Header always set X-XSS-Protection "1;  mode=block"
Header set X-Frame-Options SAMEORIGIN
Header set X-Content-Type-Options nosniff
```
#### Step 5 : Create index.html

`sudo vi /var/www/html/index.html`

Add below line in index.html

`Welcome to Tanmesh's Github`

#### Step 6 : Enable and Start httpd service

`sudo systemctl enable httpd`

`sudo systemctl start httpd`

#### Step 7 : Test using curl

`curl -i localhost:5000`

```
HTTP/1.1 200 OK
Date: Tue, 23 Aug 2022 18:51:05 GMT
Server: Apache/2.4.6 (CentOS)
X-XSS-Protection: 1;  mode=block
Last-Modified: Tue, 23 Aug 2022 18:50:14 GMT
ETag: "27-5e6ed08ec935f"
Accept-Ranges: bytes
Content-Length: 39
X-Frame-Options: SAMEORIGIN
X-Content-Type-Options: nosniff
Content-Type: text/html; charset=UTF-8

Welcome to Tanmesh's Github 
```
