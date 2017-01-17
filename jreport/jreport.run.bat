docker stop jreport
docker rm jreport
docker run -d -p 18888:8888 -p 18887:8887 -p 18889:8889 --name "jreport" devbhuwan/jreport
timeout /t 40 /nobreak
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix devbhuwan/jreport bash /usr/local/jreport/Designer/bin/JReport.sh
timeout /t 10 /nobreak
docker exec -it jreport bash
