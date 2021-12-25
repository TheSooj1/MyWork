#/bin/bash
echo "Please enter date without slashes (ie 0310 for march 10th)."
read Date
filename="${Date}_Dealer_schedule"
echo "Please enter time (use this format 05:00:00 AM)"
read timeOfDay
grep "$timeOfDay" $filename | awk -F " " '{print $5, $6}'
