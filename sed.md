# Problem Statement
There is some data on App Server in DC. Data needs to be altered in several of the files. 

On App Server, alter the /home/ABC.txt file as per details given below:

a. Delete all lines containing word code and save results in /home/ABC_DELETE.txt file. (Please be aware of case sensitivity)

b. Replace all occurrence of word or to for and save results in /home/ABC_REPLACE.txt file.

Note: Let's say you are asked to replace word to with from. In that case, make sure not to alter any words containing this string; for example upto, contributor etc.


ssh tony@stapp01

cat /home/BSD.txt | grep -v code > BSD_DELETE.txt

sed 's/\<or\>/for/g' /home/BSD.txt > BSD_REPLACE.txt

