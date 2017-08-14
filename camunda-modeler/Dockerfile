FROM java

MAINTAINER Bhuwan Upadhyay<bhuwan.upadhyay49@gmail.com>

ENTRYPOINT ["/launch.sh"]
CMD [":0"]
ENV TAR_FILE camunda-modeler-1.9.0-linux-x64.tar.gz
ENV DOWNLOAD_URL https://camunda.org/release/camunda-modeler/1.9.0/${TAR_FILE}
RUN apt-get update && apt-get install -y libcanberra-gtk-module && apt-get install -y libxss1 && rm -rf /var/lib/apt/lists/*

COPY ${TAR_FILE} /tmp/${TAR_FILE}
RUN tar -xzf /tmp/${TAR_FILE} -C /opt && rm -f /tmp/${TAR_FILE}
ADD launch.sh /launch.sh
