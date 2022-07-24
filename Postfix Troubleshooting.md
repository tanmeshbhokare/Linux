## Problem statement
Some users of the monitoring app have reported issues with xFusionCorp Industries mail server. They have a mail server in Stork DC where they are using postfix mail transfer agent. Postfix service seems to fail. Try to identify the root cause and fix it.

thor@jump_host ~$ ssh groot@stmail01
The authenticity of host 'stmail01 (172.16.238.17)' can't be established.
ECDSA key fingerprint is SHA256:vO68rNTj3XttfAKiaixVFE0f3boFY5USa2RQRJDWcmY.
ECDSA key fingerprint is MD5:c1:9d:36:f7:40:ca:dc:cb:c6:24:06:43:1c:71:51:f8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'stmail01,172.16.238.17' (ECDSA) to the list of known hosts.
groot@stmail01's password: 
[groot@stmail01 ~]$ 
[groot@stmail01 ~]$ sudo su

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for groot: 
[root@stmail01 groot]# systemctl status postfix -l
● postfix.service - Postfix Mail Transport Agent
   Loaded: loaded (/usr/lib/systemd/system/postfix.service; enabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Sun 2022-07-24 05:55:48 UTC; 1min 5s ago
  Process: 487 ExecStart=/usr/sbin/postfix start (code=exited, status=1/FAILURE)
  Process: 486 ExecStartPre=/usr/libexec/postfix/chroot-update (code=exited, status=0/SUCCESS)
  Process: 436 ExecStartPre=/usr/libexec/postfix/aliasesdb (code=exited, status=75)

Jul 24 05:55:47 stmail01.stratos.xfusioncorp.com postfix[487]: fatal: parameter inet_interfaces: no local interface found for ::1
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: Child 487 belongs to postfix.service
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service: control process exited, code=exited status=1
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service got final SIGCHLD for state start
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service changed start -> failed
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: Job postfix.service/start finished, result=failed
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: Failed to start Postfix Mail Transport Agent.
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: Unit postfix.service entered failed state.
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service failed.
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service: cgroup is empty
[root@stmail01 groot]# vi /etc/postfix/main.cf
[root@stmail01 groot]# cat /etc/postfix/main.cf  | grep inet_interface
# The inet_interfaces parameter specifies the network interface
inet_interfaces = all
#inet_interfaces = $myhostname
#inet_interfaces = $myhostname, localhost
#inet_interfaces = localhost
# the address list specified with the inet_interfaces parameter.
# receives mail on (see the inet_interfaces parameter).
# to $mydestination, $inet_interfaces or $proxy_interfaces.
# - destinations that match $inet_interfaces or $proxy_interfaces,
# unknown@[$inet_interfaces] or unknown@[$proxy_interfaces] is returned

[root@stmail01 groot]# systemctl status postfix -l
● postfix.service - Postfix Mail Transport Agent
   Loaded: loaded (/usr/lib/systemd/system/postfix.service; enabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Sun 2022-07-24 05:55:48 UTC; 7min ago
  Process: 487 ExecStart=/usr/sbin/postfix start (code=exited, status=1/FAILURE)
  Process: 486 ExecStartPre=/usr/libexec/postfix/chroot-update (code=exited, status=0/SUCCESS)
  Process: 436 ExecStartPre=/usr/libexec/postfix/aliasesdb (code=exited, status=75)

Jul 24 05:55:47 stmail01.stratos.xfusioncorp.com postfix[487]: fatal: parameter inet_interfaces: no local interface found for ::1
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: Child 487 belongs to postfix.service
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service: control process exited, code=exited status=1
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service got final SIGCHLD for state start
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service changed start -> failed
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: Job postfix.service/start finished, result=failed
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: Failed to start Postfix Mail Transport Agent.
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: Unit postfix.service entered failed state.
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service failed.
Jul 24 05:55:48 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service: cgroup is empty
[root@stmail01 groot]# systemctl start postfix
[root@stmail01 groot]# systemctl status postfix -l
● postfix.service - Postfix Mail Transport Agent
   Loaded: loaded (/usr/lib/systemd/system/postfix.service; enabled; vendor preset: disabled)
   Active: active (running) since Sun 2022-07-24 06:03:24 UTC; 3s ago
  Process: 664 ExecStart=/usr/sbin/postfix start (code=exited, status=0/SUCCESS)
  Process: 663 ExecStartPre=/usr/libexec/postfix/chroot-update (code=exited, status=0/SUCCESS)
  Process: 659 ExecStartPre=/usr/libexec/postfix/aliasesdb (code=exited, status=0/SUCCESS)
 Main PID: 735 (master)
   CGroup: /docker/c8fa6564a0c3370a7f4d2bdab80b1fc25c1c96197e4c188f58d56bb542f05ef2/system.slice/postfix.service
           ├─735 /usr/libexec/postfix/master -w
           ├─736 pickup -l -t unix -u
           └─737 qmgr -l -t unix -u

Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com systemd[664]: Executing: /usr/sbin/postfix start
Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com postfix/master[735]: daemon started -- version 2.10.1, configuration /etc/postfix
Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com systemd[1]: Child 664 belongs to postfix.service
Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service: control process exited, code=exited status=0
Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service got final SIGCHLD for state start
Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com systemd[1]: New main PID 735 belongs to service, we are happy.
Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com systemd[1]: Main PID loaded: 735
Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service changed start -> running
Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com systemd[1]: Job postfix.service/start finished, result=done
Jul 24 06:03:24 stmail01.stratos.xfusioncorp.com systemd[1]: Started Postfix Mail Transport Agent.
[root@stmail01 groot]#
