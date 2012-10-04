export JAVA_HOME=/home/oracle/CI/install/jdk1.6.0_35
export JAVA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=9999,server=y,suspend=n"

TOMCAT_HOME=/home/oracle/CI/install/apache-tomcat-6.0.29

$TOMCAT_HOME/bin/shutdown.sh

