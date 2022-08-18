## Problem statement

The ABC Industries security team recently did a security audit of their infrastructure and came up with ideas to improve the application and server security. They decided to use SElinux for an additional security layer. They are still planning how they will implement it; however, they have decided to start testing with app servers, so based on the recommendations they have the following requirements:


Install the required packages of SElinux on App server 3 in XYZ Datacenter and disable it permanently for now; it will be enabled after making some required configuration changes on this host. Don't worry about rebooting the server as there is already a reboot scheduled for tonight's maintenance window. Also ignore the status of SElinux command line right now; the final status after reboot should be disabled.

## Solution

#### Step 1 : SSH to App Server 3
`ssh user@appserver3`

#### Step 2 : Install packages required for selinux 
`sudo yum install policycoreutils policycoreutils-python setools setools-console setroubleshoot selinux-policy selinux-policy-targeted`

#### Step 3 : verify selinux packages

`sudo rpm -qa | grep selinux`
```
selinux-policy-targeted-3.13.1-268.el7_9.2.noarch
libselinux-2.5-15.el7.x86_64
libselinux-python-2.5-15.el7.x86_64
selinux-policy-3.13.1-268.el7_9.2.noarch
libselinux-utils-2.5-15.el7.x86_64
```

#### Step 4 : Check Selinux status
`sestatus`
