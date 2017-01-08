docker run -d -v config:/home/duser/config -p 8080:8080 --name "spagobi_5_2_0" devbhuwan/spagobi-all-in-one
timeout /t 15 /nobreak
docker exec -it spagobi_5_2_0 /bin/sh -c "tail -f /usr/local/spagobi/logs/catalina.out"
