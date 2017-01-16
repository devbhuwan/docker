docker stop jreport
docker rm jreport
docker run -d -p 8888:8888 --name "jreport" devbhuwan/jreport
timeout /t 10 /nobreak
docker exec -it jreport bash
::http://containerip:8888/