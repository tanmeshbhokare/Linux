The xFusionCorp Industries security team recently did a security audit of their infrastructure and came up with ideas to improve the application and server security. They decided to use SElinux for an additional security layer. They are still planning how they will implement it; however, they have decided to start testing with app servers, so based on the recommendations they have the following requirements:



Install the required packages of SElinux on App server 3 in Stratos Datacenter and disable it permanently for now; it will be enabled after making some required configuration changes on this host. Don't worry about rebooting the server as there is already a reboot scheduled for tonight's maintenance window. Also ignore the status of SElinux command line right now; the final status after reboot should be disabled.

sudo yum install policycoreutils policycoreutils-python setools setools-console setroubleshoot

[banner@stapp03 ~]$ sudo rpm -qa | grep selinux
selinux-policy-targeted-3.13.1-268.el7_9.2.noarch
libselinux-2.5-15.el7.x86_64
libselinux-python-2.5-15.el7.x86_64
selinux-policy-3.13.1-268.el7_9.2.noarch
libselinux-utils-2.5-15.el7.x86_64
[banner@stapp03 ~]$ 


[banner@stapp03 ~]$ history
    1  sudo yum install policycoreutils policycoreutils-python setools setools-console setroubleshoot
    2  kill -99 747
    3  kill -9 747
    4  sudo kill -9 747
    5  sudo yum install policycoreutils policycoreutils-python setools setools-console setroubleshoot
    6  vi /etc/selinux/config
    7  sudo rpm -qa | grep selinux
    8  sudo yum install selinux-policy
    9  sudo rpm -qa | grep selinux
   10  sudo yum install selinux-policy-targetted
   11  sudo yum install selinux-policy-targeted
   12  vi /etc/selinux/config
   13  sudo vi /etc/selinux/config
   14  sestatus
   15  sudo rpm -qa | grep selinux
   16  history
[banner@stapp03 ~]$ 

