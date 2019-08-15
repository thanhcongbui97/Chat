#!/bin/bash

LINK="/home/thanhcong/Desktop/Shell/Project/"
cd $LINK
FILE='main.c'
LINE_NO=3
SPACE="    "
TAB=""
CUR_TAB=0
while [[ LINE_NO -lt 20 ]]
do
LINE=$(sed -n $LINE_NO'p' $FILE)
if [[ $LINE == *"{"* ]]
then
    CONTENT=$(sed -n $LINE_NO'p' $FILE | grep  "{.*" -o)
    CORRECT_CONTENT=$TAB$CONTENT
    CUR_TAB=$[ $CUR_TAB + 1 ]
    C_TAB=$CUR_TAB
    STAB=""
    while [[ C_TAB -gt 0 ]]
    do
        STAB=$SPACE$STAB
        C_TAB=$[ $C_TAB - 1 ]
    done
    TAB=$STAB
elif [[ $LINE == *"}"* ]]
    then
    CONTENT=$(sed -n $LINE_NO'p' $FILE | grep  "}.*" -o)
    CUR_TAB=$[ $CUR_TAB - 1 ]
    C_TAB=$CUR_TAB
    STAB=""
    while [[ C_TAB -gt 0 ]]
    do
        STAB=$SPACE$STAB
        C_TAB=$[ $C_TAB - 1 ]
    done
    TAB=$STAB
    CORRECT_CONTENT=$TAB$CONTENT
else
    CONTENT=$(sed -n $LINE_NO'p' $FILE | grep  "[a-zA-Z].*" -o)
    CORRECT_CONTENT=$TAB$CONTENT
fi

sed -i "${LINE_NO}s/${LINE}/${CORRECT_CONTENT}/g" $FILE

LINE_NO=$(( $LINE_NO + 1 ))
done