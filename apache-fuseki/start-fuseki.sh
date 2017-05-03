export FUSEKI_HOME=/BillAuditor/install/jena-fuseki-1.0.1
export TDB_FILES=/BillAuditor/tdb-files/
#$FUSEKI_HOME/fuseki-server --loc "$TDB_FILES" --port=8083 /billauditor
nohup $FUSEKI_HOME/fuseki-server --loc "$TDB_FILES" --mem --port=8087 /billauditor &