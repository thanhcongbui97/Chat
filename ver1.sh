#!/bin/bash

LINK="/home/thanhcong/Desktop/Shell/Project/"
cd $LINK
FILE='main.c'
LINE_START=3
LINE_END=20
LINE_NO=$LINE_START
SPACE="    "
TAB=""
CUR_TAB=0
while [[ LINE_NO -lt $LINE_END ]]
do
LINE=$(sed -n $LINE_NO'p' $FILE)
get=$(sed -n $LINE_NO'p' $FILE | grep "[a-zA-Z{}].*" -o)
echo ${get:0:1}
if [[ ${get:0:1} == "{" ]]
then
    echo $LINE_NO
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
    if [[ $LINE == *[a-zA-Z]* ]]
    then
        CONTENT_TEXT=$(sed -n $LINE_NO'p' $FILE | grep  "[a-zA-Z].*" -o)
        sed -i "${LINE_NO}s/$CONTENT_TEXT/\n$CONTENT_TEXT/g" $FILE
    fi
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
    echo $LINE
    if [[ $LINE == [a-zA-Z]* ]]
    then
        echo "Aaaaa"
    fi
else
    CONTENT=$(sed -n $LINE_NO'p' $FILE | grep  "[a-zA-Z].*" -o)
    CORRECT_CONTENT=$TAB$CONTENT
fi

sed -i "${LINE_NO}s/${LINE}/${CORRECT_CONTENT}/g" $FILE

LINE_NO=$(( $LINE_NO + 1 ))
done