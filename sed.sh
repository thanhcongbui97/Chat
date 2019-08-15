#!/bin/bash

LINK="/home/thanhcong/Desktop/Shell/Project/"
cd $LINK
FILE='main.c'
TAB=0
LINE=5
SPACE="    "
get=$(sed -n $LINE'p' $FILE)
alpha=$(sed -n $LINE([a-ZA-Z].*)
echo $alpha
if [[ $get == [a-zA-Z]* ]]
then
edit=$SPACE$get
sed -i "5s/$get/$edit/g" $FILE
else
edit=${get%%[a-z]*};
sed -i "5s/$edit/\t/g" $FILE
fi
echo $edit
#sed -i $LINE'd' $FILE
