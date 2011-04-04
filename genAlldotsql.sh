SQL_FILES_PATH=$1
cd $SQL_FILES_PATH
echo "@@" *.sql | sed s/\\s/\\n@@/g | grep -iv '@@$'> All.sql

