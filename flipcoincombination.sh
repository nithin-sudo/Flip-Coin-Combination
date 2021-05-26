#!/bin/bash -x
echo "Flip Coin Combination Problem"
ran=$((RANDOM%2))
if [ $ran -eq 1 ]
then
        echo "Coin faces HEAD"
else
        echo "Coin faces TAIL"
fi
