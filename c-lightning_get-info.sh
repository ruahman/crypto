#!/bin/bash

docker-compose exec c-lightning /bin/bash -c "cli getinfo"
