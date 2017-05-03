SET JENAROOT=D:\Development\apache-jena-3.2.0\apache-jena-3.2.0\
SET TDB_FILES_PATH="D:\Work\VFE_AFKARNA_Bill Auditor\R4\TestingFiles\tdb"
SET BCH_SRC_FILES_PATH="D:\Work\VFE_AFKARNA_Bill Auditor\R4\TestingFiles\RDF-XML-Files\BCH_948_948-1450220160.rdf"
%JENAROOT%\bat\tdbloader.bat --loc=%TDB_FILES_PATH% %BCH_SRC_FILES_PATH%