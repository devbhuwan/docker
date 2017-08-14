FROM node:latest
ENV ZIP_FILE master.zip
ENV FROMIO_DOWNLOAD_URL https://github.com/formio/formio/archive/${ZIP_FILE}
RUN wget -O /tmp/${ZIP_FILE} ${FROMIO_DOWNLOAD_URL}
RUN apt-get update && apt-get install -y zip
RUN mkdir -p formio
RUN unzip /tmp/${ZIP_FILE} -d formio
WORKDIR formio/formio-master
RUN npm install
COPY default.json config/
RUN npm start
ENTRYPOINT ["/launch.sh"]