#!/bin/bash

find /home/usersdata/* -user yousuf | cpio -pdm /media
mv /media/home/usersdata/* /media/
cd /media
rm -rf /home/
