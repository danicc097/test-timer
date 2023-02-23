#!/bin/bash

set -e

mkdir -p /home/arenaops/arena-auth_postgres_dumps_prod/
cd /home/arenaops/arena-auth-service && ./bin/backup prod
find /home/arenaops/arena-auth_postgres_dumps_prod/  -type f -mtime +33 -delete
message="$(find /home/arenaops/arena-auth_postgres_dumps_prod/ -type f -printf "%p - %k KB\n" | sort -n | tail -1)"

cd "/home/arenaops/bookstack"
./backup
dir="/data/bookstack_backups/$( date --iso-8601)"
mkdir -p $dir
find "/data/bookstack_backups/" -type d  -mtime +15 -exec rm -rf {} \;
cp bookstack_bookstack-storage-uploads-backup.tar $dir # requires setfacl -d -m g::rwx on $dir if applicable
cp bookstack_bookstack-uploads-backup.tar $dir
cp backup.sql $dir
message="$(du -sh "$dir")"

