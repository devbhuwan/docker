#!/bin/bash
#copy the original files
cp ${SPAGOBI_HOME}/conf/server.xml ${SPAGOBI_HOME}/conf/server.xml.bak
cp ${SPAGOBI_HOME}/webapps/SpagoBI/WEB-INF/classes/hibernate.cfg.xml ${SPAGOBI_HOME}/webapps/SpagoBI/WEB-INF/classes/hibernate.cfg.xml.bak
cp ${SPAGOBI_HOME}/webapps/SpagoBI/WEB-INF/classes/jbpm.hibernate.cfg.xml ${SPAGOBI_HOME}/webapps/SpagoBI/WEB-INF/classes/jbpm.hibernate.cfg.xml.bak
cp ${SPAGOBI_HOME}/webapps/SpagoBI/WEB-INF/classes/quartz.properties ${SPAGOBI_HOME}/webapps/SpagoBI/WEB-INF/classes/quartz.properties.bak

# Get the database values from the relation.
DB_USER=$DB_ENV_ORACLE_USER
DB_PASS=$DB_ENV_ORACLE_PASSWORD
DB_SID=$DB_ENV_ORACLE_SID
DB_HOST=$DB_PORT_1521_TCP_ADDR
DB_PORT=$DB_PORT_1521_TCP_PORT

#replace hsql with oracle
#replace in server.xml
old_driver='org\.hsqldb\.jdbcDriver'
new_driver='oracle\.jdbc\.OracleDriver'
sed -i "s|${old_driver}|${new_driver}|" ${SPAGOBI_HOME}/conf/server.xml
old_connection='jdbc:hsqldb:file:${catalina.base}/database/spagobi'
new_connection='jdbc:oracle:thin:@'${DB_HOST}':'${DB_PORT}':'${DB_SID}
sed -i "s|${old_connection}|${new_connection}|" ${SPAGOBI_HOME}/conf/server.xml
old_username_password='username="sa" password=""'
new_username_password='username="'${DB_USER}'" password="'${DB_PASS}'"'
sed -i "s|${old_username_password}|${new_username_password}|" ${SPAGOBI_HOME}/conf/server.xml
#replace in properties files dialect
old_dialect='org\.hibernate\.dialect\.HSQLDialect'
new_dialect='org\.hibernate\.dialect\.Oracle10gDialect'
sed -i "s|${old_dialect}|${new_dialect}|" ${SPAGOBI_HOME}/webapps/SpagoBI/WEB-INF/classes/hibernate.cfg.xml
sed -i "s|${old_dialect}|${new_dialect}|" ${SPAGOBI_HOME}/webapps/SpagoBI/WEB-INF/classes/jbpm.hibernate.cfg.xml
#replace in properties files delegate org.quartz.impl.jdbcjobstore.oracle.OracleDelegate
old_delegate='org\.quartz\.impl\.jdbcjobstore\.HSQLDBDelegate'
new_delegate='org\.quartz\.impl\.jdbcjobstore\.oracle\.OracleDelegate'
sed -i "s|${old_delegate}|${new_delegate}|" ${SPAGOBI_HOME}/webapps/SpagoBI/WEB-INF/classes/quartz.properties

exec "$@"