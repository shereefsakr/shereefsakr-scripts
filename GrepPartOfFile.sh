#<<Parameterized #Enabled
FILE_NAME=$1
GREP_START_STRING=$2
GREP_END_STRING=$3
#Parameterized

GREP_START=$(grep -in "$echo $GREP_START_STRING" $FILE_NAME | awk -F: '{printf "%s", $1 "\n"}' | head -n 1)
GREP_END=$(grep -in "$echo $GREP_END_STRING" $FILE_NAME | awk -F: '{printf "%s", $1 "\n"}' | head -n 1)
awk $echo "NR>=$GREP_START && NR<=$GREP_END" $FILE_NAME
