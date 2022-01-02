#!/bin/bash

docker-compose exec bitcoind /bin/bash -c "cli getblockchaininfo | jq .blocks"
