pid=$(ps -fe | grep 'fuseki' |grep -v grep | awk '{print $2}')
if [[ -n $pid ]]; then
    kill -9 $pid
else
    echo "Does not exist"
fi