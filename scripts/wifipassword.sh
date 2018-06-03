INPUT=$(iwgetid)
echo $INPUT
SUBSTRING=$(echo $INPUT| cut -d'"' -f 2)
echo $SUBSTRING
