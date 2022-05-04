#!/bin/bash
read -p  "What date are you looking for? MMDD" $1
read -p  "What time are you looking for? (00 AM/PM)" $2 $3

grep ''$2':00:00 '$3'' $1_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' 


