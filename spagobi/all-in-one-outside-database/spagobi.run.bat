#set /p PORT=What is your DB Port?
docker rm spagobi_5_2_0_outside_database
docker run -e DB_ENV_ORACLE_USER=spagobi -e DB_ENV_ORACLE_PASSWORD=spagobi -e DB_ENV_ORACLE_SID=xe -e DB_PORT_1521_TCP_ADDR=192.168.99.100 -e DB_PORT_1521_TCP_PORT=32779 -d -p 18080:8080 --name "spagobi_5_2_0_outside_database" devbhuwan/spagobi-all-in-one-outside-database
timeout /t 10 /nobreak
docker exec -it spagobi_5_2_0_outside_database /bin/sh -c "tail -f /usr/local/spagobi/logs/catalina.out"
