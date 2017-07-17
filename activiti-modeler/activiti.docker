#
#	Activiti Modeler 6.0.0
#
FROM openjdk:8-jre
MAINTAINER Bhuwan Prasad Upadhyay <bhuwan.upadhyay49@gmail.com>

RUN groupadd --gid 1004 duser && \
    useradd --system --uid 1003 --gid 1004 --home /home/duser --shell /bin/bash duser

ENV ACTIVITI_APP_TOMCAT_HOME /usr/local/tomcat
ENV TOMCAT_VERSION=apache-tomcat-8.5.16
ENV TOMCAT_ZIP_URL=http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/${TOMCAT_VERSION}.zip

RUN mkdir -p /home/duser
RUN chown -R duser:duser /home && chown -R duser:duser /usr/local
RUN chmod -R 777 /home && chmod -R 777 /usr/local
USER duser

WORKDIR /home/duser

RUN wget "${TOMCAT_ZIP_URL}" -O tomcat.zip && \
	unzip tomcat.zip && \
    mv ${TOMCAT_VERSION} ${ACTIVITI_APP_TOMCAT_HOME} && \
    rm tomcat.zip

ADD activiti-app.war ${ACTIVITI_APP_TOMCAT_HOME}/webapps/activiti-app.war

RUN ls -l

USER root
RUN chown duser:duser ${ACTIVITI_APP_TOMCAT_HOME}/webapps/activiti-app.war
USER duser

RUN	chmod -R 775 $ACTIVITI_APP_TOMCAT_HOME

EXPOSE  8080

CMD cd ${ACTIVITI_APP_TOMCAT_HOME}/bin && ./catalina.sh run