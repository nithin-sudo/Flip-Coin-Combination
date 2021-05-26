#!/bin/bash
echo "Flip Coin Combination Problem"
declare -A dict
read -p "Enter the number to flip coin: " nmb
function coin()
{
case $1 in
        111) echo "HHH" ;;
        110) echo "HHT" ;;
        101) echo "HTH" ;;
        100) echo "HTT" ;;
        011) echo "THH" ;;
        010) echo "THT" ;;
        001) echo "TTH" ;;
	000) echo "TTT" ;;
        000) echo "TTH" ;;
esac
}
for ((i=1; i<=$nmb; i++))
do
        ran=$((RANDOM%2))$((RANDOM%2))$((RANDOM%2))
        ((++dict[`coin $ran`]))
done
for key in ${!dict[@]}
do
        val=$(perl -e "{print (${dict[$key]}/$nmb * 100)}")
        echo "Percentage of Winning $key is $val"
done
