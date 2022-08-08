## Problem Statement
There is some data on App Server in DC. which needs to be altered. 

alter the /home/ABC.txt file as per details given below:

- Delete all lines containing word `code` and save results in `/home/ABC_DELETE.txt` file. (Please be aware of case sensitivity)

- Replace all occurrence of word `or` to `for` and save results in `/home/ABC_REPLACE.txt` file.

Note: Let's say you are asked to replace word `to` with `from`. In that case, make sure not to alter any words containing this string; 

for example: up`to`, contribu`to`r etc.

## Solution

#### Step 1 : SSH to app server 

```
ssh user@app_server
```

#### Step 2 : Use below command for deleting lines containing word "code" in it, 

```
cat /home/BSD.txt | grep -v code > BSD_DELETE.txt
```

#### Step 3 : Use below command for replacing word "or" with "for"

```
sed 's/\<or\>/for/g' /home/BSD.txt > BSD_REPLACE.txt
```
