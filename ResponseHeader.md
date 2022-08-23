## Problem Statement

We are working on hardening Apache web server on all app servers. As a part of this process we want to add some of the Apache response headers for security purpose. We are testing the settings one by one on all app servers. As per details mentioned below enable these headers for Apache:


Install `httpd` package on App Server 2 using yum and configure it to run on `3003` port, make sure to start its service.

Create an `index.html` file under Apache's default document root i.e `/var/www/html` and add below given content in it.

`Welcome to the Tanmesh's Github`

Configure Apache to enable below mentioned headers:

`X-XSS-Protection` header with value `1; mode=block`

`X-Frame-Options` header with value `SAMEORIGIN`

`X-Content-Type-Options` header with value `nosniff`

Note: You can test using curl on the given app server as LBR URL will not work for this task.


## Solution

Step 1 : ssh to app server

Step 2 : install httpd uging yum

Step 3 : configure httpd.conf

`sudo vi /etc/httpd/conf/httpd.conf`

Step 4 : Enable and start httpd

`sudo systemctl enable httpd`

`sudo systemctl start httpd`

Step 5 :


```
[steve@stapp02 ~]$ sudo vi /etc/httpd/conf/httpd.conf
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ tail /etc/httpd/conf/httpd.conf
EnableSendfile on

# Supplemental configuration
#
# Load config files in the "/etc/httpd/conf.d" directory, if any.
IncludeOptional conf.d/*.conf

Header always set X-XSS-Protection "1;  mode=block"
Header set X-Frame-Options SAMEORIGIN
Header set X-Content-Type-Options nosniff
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
```

[banner@stapp03 ~]$ curl -i localhost:5000
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

Welcome to the xFusionCorp Industries!
[banner@stapp03 ~]$ history
    1  sudo yum install httpd -y
    2  sudo vi /etc/httpd/conf/httpd.conf 
    3  sudo vi /var/www/html/index.html
    4  sudo systemctl enable httpd
    5  sudo systemctl start httpd
    6  sudo systemctl status httpd
    7  curl localhost:5000
    8  curl -i localhost:5000
    9  history
[banner@stapp03 ~]$ 
