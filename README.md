**Task1**
Refer   to   the   following   URL   for   a   sample   of   an   apache   log   file.   You   can   use   this   as   test data   for   testing   your   task   below. https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Form ats/apache_logs/apache_logs A.
Write   a   bash   script   that: ●Counts   the   number   of   HTTP   4xx   and   5xx   response   statuses   in   the   apache log   file.   The   filename   would   be   provided   as   a   parameter   to   the   script ●If   the   cumulative   number   of   errors   exceeds   100,   send   an   email   alert reporting   on   the   high   number   of   error   responses   and   relevant   information ●The   script   is   expected   to   be   run   periodically   (e.g.   every   hour)   to   check   if the   threshold   for   the   errors   have   been   met   for   the   period   of   time. 
![image](https://user-images.githubusercontent.com/83395777/117582132-13e2a100-b133-11eb-9aa2-edba89ec225b.png)


**Solution**

# bashscript_400_500_errors_alert

Below are the steps to be followed to execute the script
------------------------------------------------------------
1) save the above script in a file error-codes.sh
2) give execute permission to the script file:
    chmod 755 error-codes.sh
3) command to run the script by giving log file as argument
./error-codes.sh /ngs/app/home/muhanp/muhan/tomcat/logs/localhost_access_log..2021-05-01.txt
4) cron to run the job every hour:
0 */1 * * * /error-codes.sh /ngs/app/home/muhanp/muhan/tomcat/logs/localhost_access_log..2021-05-01.txt


B. As   time   passes,   the   log   files   for   your   application   have   piled   up,   and   the   machine is   running   out   of   storage.   Briefly   describe   how   you   would   resolve   this   in   a   short paragraph,   taking   into   considerations   that: a.On   rare   occasion,   logs   up   to   3   months   old   are   required   for   troubleshooting /investigations b.Audit   requirements   dictate   that   logs   are   to   be   kept   for   at   least   7   years c.The   machine   is   currently   storing   6   months   worth   of   logs,   and   would   run out   of   storage   within   the   week.   Increasing   storage   is   not   an   option   within the   next   12   months![image](https://user-images.githubusercontent.com/83395777/117582185-6459fe80-b133-11eb-8239-1167f1adce6f.png)

**solution**
 To manage the storage efficiently below are the options we are proceed.
 **option1** In general log levels are FATAL,ERROR ,WARN,DEBUG,INFO,TRACE,ALL .
     incase if all logs are are writing then we need to discuss with application team and we need to change to INFO mode to reduce the logs writing.The debug log we can   enable temperory when really required.most of the time issues can be identified using error,info.
  **option2**
  Identify list of log files like application.log,build logs,batch related logs etc. anything available server.Then Introduce archival process  and move those logs to any other server where the space available until we increase the storage capacity.
   **option3**
  If using log auditing tools already like splunk,ELK push those logs to server
  
  above are the possible ways we can optimise the storage and can manage to an extent.
