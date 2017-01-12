docker rm spagobi_5_2_0
docker run -d -v -p 8080:8080 --name "spagobi_5_2_0" devbhuwan/spagobi-all-in-one
timeout /t 10 /nobreak
docker exec -it spagobi_5_2_0 /bin/sh -c "tail -f /usr/local/spagobi/logs/catalina.out"
