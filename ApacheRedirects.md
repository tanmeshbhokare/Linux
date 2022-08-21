## Problem Statement

The devops team got some requirements related to some Apache config changes. They need to setup some redirects for some URLs. There might be some more changes need to be done. Below you can find more details regarding that:

httpd is already installed on app server. Configure Apache to listen on port 8088.

Configure Apache to add some redirects as mentioned below:

a.) Redirect http://app01.xcorp.com:<Port>/ to http://www.app01.xcorp.com:<Port>/ i.e non www to www. This must be a permanent redirect i.e 301

b.) Redirect http://www.app01.xcorp.com:<Port>/blog/ to http://www.app01.xcorp.com:<Port>/news/. This must be a temporary redirect i.e 302.
  
## Solution
  
#### Step 1 : SSH to app server

  `ssh user@appserver`
 
#### Step 2 : check default port 

  `cat /etc/httpd/conf/httpd.conf | grep Listen`
  
#### Step 3 : change default port
  
  `vi /etc/httpd/conf/httpd.conf`
  
Modify `Listen 8080` to `Listen 8088`
  
```
# Listen: Allows you to bind Apache to specific IP addresses and/or

# Change this to Listen on specific IP addresses as shown below to

#Listen 12.34.56.78:80

Listen 8088
```
