#!/bin/bash

MYLOG=`ls -ltr /var/lib/awx/job_status | awk -F' ' '{print $9}'| tail -1`

echo "  "
echo " Current time : `date| awk -F' ' '{print $2 " " $3 " " $4}'` "
echo " Logfile time : `ls -ltr /var/lib/awx/job_status | awk -F' ' '{print $6 " " $7 " " $8}' | tail -1`"
echo " Last logfile : `ls -ltr /var/lib/awx/job_status | awk -F' ' '{print $9}' | tail -1`"
echo "   "
tailf /var/lib/awx/job_status/$MYLOG
echo "   "
