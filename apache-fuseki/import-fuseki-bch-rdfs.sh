export JENAROOT=/BillAuditor/install/apache-jena-2.11.0
export TDB_FILES_PATH="/BillAuditor/tdb-files/"
export BCH_SRC_FILES_PATH="/BillAuditor/rdf-files/BCH-RDFs/*.rdf"
$JENAROOT/bin/tdbloader --loc=$TDB_FILES_PATH $BCH_SRC_FILES_PATH