export JENAROOT=/BillAuditor/install/apache-jena-2.11.0
export TDB_CMD="$JENAROOT/bin/tdbloader2"
export TDB_FILES_PATH="/BillAuditor/tdb-files/"

export BSCS_SRC_FILES_PATH="/BillAuditor/rdf-files/BSCS-RDFs/*.rdf"
export BCH_SRC_FILES_PATH="/BillAuditor/rdf-files/BCH-RDFs/*.rdf"

$JENAROOT/bin/tdbloader2 --loc=$TDB_FILES_PATH $BSCS_SRC_FILES_PATH
$JENAROOT/bin/tdbloader --loc=$TDB_FILES_PATH $BCH_SRC_FILES_PATH