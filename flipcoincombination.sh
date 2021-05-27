#!/bin/bash
#!/bin/bash
echo "Flip Coin Combination Problem"
declare -A dict
read -p "Enter the number to flip coin: " nmb
function coin()
{
case $1 in
        1) echo "H" ;;
        0) echo "T" ;;
        11) echo "HH" ;;
        10) echo "HT" ;;
        01) echo "TH" ;;
        00) echo "TT" ;;
        111) echo "HHH" ;;
        110) echo "HHT" ;;
        101) echo "HTH" ;;
        100) echo "HTT" ;;
        011) echo "THH" ;;
        010) echo "THT" ;;
        001) echo "TTH" ;;
        000) echo "TTT" ;;
esac
}
for ((i=1; i<=$nmb; i++))
do
        random=$((RANDOM%3+1))
        if [ $random -eq 1 ]
        then
                ran1=$((RANDOM%2))
                ((++dict[`coin $ran1`]))
        elif [ $random -eq 2 ]
        then
                ran2=$((RANDOM%2))$((RANDOM%2))
                ((++dict[`coin $ran2`]))
        else
                ran3=$((RANDOM%2))$((RANDOM%2))$((RANDOM%2))
                ((++dict[`coin $ran3`]))
        fi
done
i=0
for key in ${!dict[@]}
do
        val=$(perl -e "{print (${dict[$key]}/$nmb * 100)}")
        echo "Percentage of Winning $key is $val"
        array[i++]=$(perl -e "{print (${dict[$key]}/$nmb * 100)}")
done
i=0
echo ${array[@]}
for ((i=0; i<nmb; i++))
do
  for ((j=0; j<i; j++))
  do
    if [[ ${array[$i]} -gt ${array[$j]} ]]
    then
        temp=${array[$j]}
        array[$j]=${array[$i]}
        array[$i]=$temp
    fi
  done
done
echo -e "Ascending order of combinations\n${array[@]}"
echo ${array[0]} is the highest value
