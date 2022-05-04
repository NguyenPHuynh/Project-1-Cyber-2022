#!/bin/bash
read -p  "What time are you looking for? 00 AM/PM " $1 $2
read -p  "What day are you looking for? MMDD " $3
read -p "What casino game are you looking for? BlackJack(1) , Roulette(2), Texas(3)) " $4

if [[ $4 == 1 ]]; then grep ''$1':00:00 '$2'' $3_Dealer_schedule | awk -F" " '{print $1, $2, $3, $4}'
elif [[ $4 == 2 ]]; then grep ''$1':00:00 '$2'' $3_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}'
elif [[ $4 == 3 ]]; then grep ''$1':00:00 '$2'' $3_Dealer_schedule | awk -F" " '{print $1. $2, $7, $8}'
else echo "Please choose 1, 2 or 3"
fi
