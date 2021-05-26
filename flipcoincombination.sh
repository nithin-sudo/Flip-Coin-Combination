#!/bin/bash
echo "Flip Coin Combination Problem"
declare -A dict
read -p "Enter the number to flip coin: " nmb
function coin()
{
case $1 in
        11) echo "HH" ;;
        10) echo "HT" ;;
        01) echo "TH" ;;
        00) echo "TT" ;;
esac
}
for ((i=1; i<=$nmb; i++))
do
        ran=$((RANDOM%2))$((RANDOM%2))
        ((++dict[`coin $ran`]))
done
for key in ${!dict[@]}
do
        val=$(perl -e "{print (${dict[$key]}/$nmb * 100)}")
        echo "Percentage of Winning $key is $val"
done
