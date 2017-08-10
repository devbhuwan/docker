FROM java

MAINTAINER Bhuwan Upadhyay<bhuwan.upadhyay49@gmail.com>

ENTRYPOINT ["/launch.sh"]
CMD [":0"]
ENV TAR_FILE eclipse-java-oxygen-R-linux-gtk-x86_64.tar.gz
ENV DOWNLOAD_URL http://mirror.library.ucy.ac.cy/eclipse/technology/epp/downloads/release/oxygen/R/${TAR_FILE}

ENV BPM2_MODELER_UPDATE_SITE http://download.eclipse.org/bpmn2-modeler/updates/oxygen/1.4.0

RUN apt-get update && apt-get install -y libcanberra-gtk-module && rm -rf /var/lib/apt/lists/*

COPY ${TAR_FILE} /tmp/${TAR_FILE}
RUN tar -xzf /tmp/${TAR_FILE} -C /opt && rm -f /tmp/${TAR_FILE}
ADD launch.sh /launch.sh
