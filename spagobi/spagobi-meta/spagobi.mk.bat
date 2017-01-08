del spagobi-meta.dbox
docker build -f spagobi-tools.docker -t devbhuwan/spagobi-meta .
docker save devbhuwan/spagobi-meta -o spagobi-meta.dbox
