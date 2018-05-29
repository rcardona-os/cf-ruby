#!/bin/bash

MYLOG=`ls -ltr /var/lib/awx/job_status | awk -F' ' '{print $9}'| tail -1`

echo /var/lib/awx/job_status/$MYLOG
