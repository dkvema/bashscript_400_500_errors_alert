#!/bin/bash
# check if argument provided
if [[ -z "$1" ]]; then
    echo "No argument provided. Please provide log file with its full path."
    exit 1;
fi
log_file=$1
# check if log file exists
if [[ ! -f $log_file ]]; then
    echo "Log file not found. Exiting..."
    exit 1;
fi
# grep HTTP status codes 4xx 5xx
status_count=`grep "HTTP/1\.[01]\" [45]0." $log_file | wc -l`
# properties for sending email notification
email_to="your_email_id@example.com"
email_subject="ERROR: HTTPS Status 4xx 5xx Found"
email_body="ERROR : high number of errors found: current error count is $status_count"
if (( $status_count > 100 )); then
   echo $email_body | mail -s "$email_subject" "$email_to"
fi
