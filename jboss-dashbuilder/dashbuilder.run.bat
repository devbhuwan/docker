docker stop dashbuilder-6-2-0
docker rm dashbuilder-6-2-0
docker run -d -p 8080:8080 --name "dashbuilder-6-2-0" devbhuwan/dashbuilder
timeout /t 10 /nobreak
docker exec -it dashbuilder-6-2-0 bash
::http://containerip:8080/dashbuilder