docker rm dashboard-builder-6-2-0
docker run -d -p 8080:8080 --name "dashboard-builder-6-2-0" devbhuwan/dashboard-builder
timeout /t 10 /nobreak
docker exec -it dashboard-builder-6-2-0 /bin/sh -c "tail -f /usr/local/spagobi/logs/catalina.out"
