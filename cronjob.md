## Problem statement

The system admins team has prepared scripts to automate several day-to-day tasks. They want them to be deployed on all app servers in DC on a set schedule. Before that they need to test similar functionality with a sample cron job. Therefore, perform the steps below:

a. Install cronie package on all app servers and start crond service.

b. Add a cron `*/5 * * * * echo hello > /tmp/cron_text` for `root` user.

## Solution

#### Step 1 : SSH to app server

`ssh user@app_server1`

#### Step 2 : Install cronie package

`sudo yum install cronie -y`

#### Step 3 : Enable crond service

`sudo systemctl enable crond`

#### Step 4 : Start crond service

`sudo systemctl start crond`

#### Step 5 : Add cronjob to cron table

`sudo crontab -e`

Add below line and save using `:wq`

```
*/5 * * * * root echo hello > /tmp/cron_text
```

#### Step 6 : Check cronjob is added or not

`crontab -l`

```
Output:
*/5 * * * * root echo hello > /tmp/cron_text
```

#### Step 7 : Follow above steps for all other servers, or write an ansible playbook
