## Problem statement

As per new application requirements shared by the project development team, serveral new packages need to be installed on all app servers in Datacenter. Most of them are completed except for `zip`.

Therefore, install the `zip` package on all app-servers.

## Solution

SSH to app server and use below command

`sudo yum install zip -y`
