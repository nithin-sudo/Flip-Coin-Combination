#!/bin/bash -x
echo "Flip Coin Combination Problem"
ran=$((RANDOM%2))
echo "Flip Coin Combination Problem"
declare -A dict
read -p "Enter the number to flip coin: " nmb

for ((i=1; i<=$nmb; i++))
do
        ran=$((RANDOM%2))
        if [ $ran -eq 1 ]
        then
                ((++dict[H]))
        else
                ((++dict[T]))
        fi
done
echo "By flipping the coin $nmb times"
echo "it faces Head ${dict[H]} times & Tail ${dict[T]} times"

win_head=$( perl -e "{print (${dict[H]}/$nmb * 100)}")
win_tail=$( perl -e "{print (${dict[T]}/$nmb * 100)}")
