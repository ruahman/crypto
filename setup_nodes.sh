#!/bin/bash

. ./helpers.sh

echo "Start setup for lightning..."

echo "======================================================"
echo
echo "Waiting for nodes to startup"
echo -n "- Waiting for bitcoind startup..."

# wait till over 101 blocks are mined
wait-for-docker bitcoind "cli getblockchaininfo | jq -e \".blocks > 101\""

echo -n "- Waiting for bitcoind mining..."

# check if balance is over 50 btc
wait-for-docker bitcoind "cli getbalance | jq -e \". > 50\""

echo -n "- Waiting for c-lighting startup..."

# wait for c-lighting info
wait-for-docker c-lightning "cli getinfo"


echo -n "- Waiting for lnd startup..."

# wait for lnd info
wait-for-docker lnd "cli getinfo"

echo -n "- Waiting for eclair startup..."

# wait for eclair info
wait-for-docker eclair "cli getinfo"

echo -n "- Waiting for lnd2 startup..."

# wait for lnd2 info
wait-for-docker lnd2 "cli getinfo"

echo "======================================================"
echo
echo "Getting node IDs"
clightning_address=$(docker-compose exec c-lightning /bin/bash -c 'cli getinfo | jq -r .id')
lnd_address=$(docker-compose exec lnd /bin/bash -c "cli getinfo | jq -r .identity_pubkey")
eclair_address=$(docker-compose exec eclair /bin/bash -c "cli getinfo | jq -r .nodeId")
lnd2_address=$(docker-compose exec lnd2 /bin/bash -c "cli getinfo | jq -r .identity_pubkey")

# Show node IDs
echo "- c-lightning:  ${clightning_address}"
echo "- lnd:  ${lnd_address}"
echo "- elair:  ${eclair_address}"
echo "- lnd2:  ${lnd2_address}"

echo "======================================================"
echo
echo "Waiting for Lightning nodes to sync the blockchain"

echo -n "- Waiting for lnd chain sync..."
wait-for-docker lnd "cli getinfo | jq -e \".synced_to_chain == true\""

echo -n "- Waiting for c-lightning chain sync..."
wait-for-docker c-lightning "cli getinfo | jq -e \".blockheight > 100\""

echo -n "- Waiting for eclair chain sync..."
wait-for-docker eclair "cli getinfo | jq -e \".blockHeight > 100\"" 

echo -n "- Waiting for lnd2 chain sync..."
wait-for-docker lnd2 "cli getinfo | jq -e \".synced_to_chain == true\""

echo "now run setup_channels"

# echo "======================================================"
# echo
# echo "Setting up connections and channels"
# echo "- lnd to c-lightning"

# docker-compose exec lnd /bin/bash -c "cli listpeers | jq -e '.peers[] | select(.pub_key == \"${clightning_address}\")'"
# echo "- c-lightning:  ${clightning_address}"
# echo "- lnd:  ${lnd_address}"
# echo "- elair:  ${eclair_address}"
# echo "- lnd2:  ${lnd2_address}"
# docker-compose exec lnd /bin/bash -c "cli listpeers | jq -e '.peers[] | select(.pub_key == \"039f3f528f201365746bd6f5b6a6c5a870c7af77ceeb5dff59aced3b445076bff9\")'"
# echo try it with clighting_var
# echo "select(.pub_key == $clightning_address)"
# # run-in-docker lnd "cli listpeers | jq -e '.peers[] | select(.pub_key == \"${clightning_address}\")'" 
# # run-in-docker lnd "cli listpeers | jq -e '.peers[] | select(.pub_key == \"${clightning_address}\")' > /dev/null" \
# # && {
# # 	echo "- lnd already connected to c-lightning"
# # } || {
# # 	echo "- Open connection from lnd node to c-lightning node"
# # 	# wait-for-docker lnd "cli connect ${clightning_address}@c-lightning"
# # }

