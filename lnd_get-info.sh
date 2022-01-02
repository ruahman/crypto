#!/bin/bash

docker-compose exec lnd /bin/bash -c "cli getinfo"
