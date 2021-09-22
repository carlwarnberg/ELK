#!/bin/bash/
grep $1":00:00 "$2 $3_Dealer_schedule | awk '{print $5, $6}'


