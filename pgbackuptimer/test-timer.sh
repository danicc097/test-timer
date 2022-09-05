#!/bin/bash

cd "$HOME"/ftrs && ./bin/backup prod
find "$HOME"/ftrs_postgres_dumps_prod/  -type f -mtime +63 -delete
