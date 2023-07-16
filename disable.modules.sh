#!/bin/bash

docker compose up -d ac-database
for file in $(find ./scripts/ -name "*down.sql"); do
  docker cp $file acore-docker-ac-database-1:/tmp/file.sql
  docker exec acore-docker-ac-database-1 bash -c "mysql -uroot -ppassword acore_world < /tmp/file.sql"
  docker exec acore-docker-ac-database-1 rm /tmp/file.sql
done
