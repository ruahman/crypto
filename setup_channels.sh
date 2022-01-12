. ./helpers.sh

clightning_address="0251f0502d4b4658d6dc2f08e0ce2ddb1e409d75875e74736ea6511007cc82f18f"
lnd_address="026db536a1611cdffcbcb1cb374f19c954c2f0639241f0ea65bfa4c9034f1bf1b0"
eclair_address="03958cff634720d6ad4b0168a6d102463b6ec9dad275d0ab40d69aba5d265bbb9e"
lnd2_address="031c734517a63413d52e331e1ee7c7b56c1d8d81abe4132ac36fd5b06f4345196a"

echo "- c-lightning:  ${clightning_address}"
echo "- lnd:  ${lnd_address}"
echo "- elair:  ${eclair_address}"
echo "- lnd2:  ${lnd2_address}"

echo "======================================================"
echo
echo "Setting up connections and channels"
echo "- lnd to c-lightning"

#### lnd to c-lightning

# setup peer
docker-compose exec lnd /bin/bash -c "cli listpeers | jq -e '.peers[] | select(.pub_key == \"${clightning_address}\")' > /dev/null" \
&& {
  echo "lnd is already connected to c-lightning"
} || {
  echo "setup connection with lnd to c-lightning"
  wait-for-docker lnd "cli connect ${clightning_address}@c-lightning"
}

# setup channel
docker-compose exec lnd /bin/bash -c "cli listchannels | jq -e '.channels[] | select(.remote_pubkey == \"${clightning_address}\")' > /dev/null" \
&& {
  echo "channel between lnd and c-lightning already exists"
} || {
  echo "create a channel between lnd and c-lightning"
  wait-for-docker lnd "cli openchannel ${clightning_address} 1000000"
}

### c-lightning to eclair

# setup peers
docker-compose exec c-lightning /bin/bash -c "cli listpeers | jq -e '.peers[] | select(.id == \"${eclair_address}\")' > /dev/null" \
&& {
  echo "connection between c-lightning and eclair already exists"
} || {
  echo "setup connection between c-lightning and eclair"
  wait-for-docker c-lightning "cli connect ${eclair_address}@eclair"
}

docker-compose exec c-lightning /bin/bash -c "cli listchannels | jq -e '.channels[] | select(.destination == \"${eclair_address}\")' > /dev/null" \
&& {
  echo "a channel between c-lightning and eclair alread exists"
} || {
  echo "setup a channel between c-lighting and eclair"
  wait-for-docker c-lightning "cli fundchannel ${eclair_address} 1000000"
} 

### eclair to lnd2

# setup connection
docker-compose exec eclair /bin/bash -c "cli peers | jq -e '.[] | select(.nodeId == \"${lnd2_address}\" and .state == \"CONNECTED\")' > /dev/null" \
&& {
  echo "eclair is connected to lnd2"
} || {
  echo "setup connection between eclair and lnd2"
  wait-for-docker eclair "cli connect --uri=${lnd2_address}@lnd2"
}

docker-compose exec eclair /bin/bash -c "cli channels | jq -e '.[] | select(.nodeId == \"${lnd2_address}\" and .state == \"NORMAL\")' > /dev/null" \
&& {
  echo "channel setup between eclair and lnd2"
} || {
  echo "setup channel between eclair and lnd2"
  wait-for-docker eclair "cli open --nodeId=${lnd2_address} --fundingSatoshis=1000000"
}  


echo "All channels created"
echo "======================================================"
echo
echo "Waiting for channels to be confirmed on the blockchain"

echo -n "- Waiting for lnd channel confirmation..."
wait-for-docker lnd "cli listchannels | jq -e '.channels[] | select(.remote_pubkey == \"${clightning_address}\" and .active == true)'"

echo -n "- Waiting for c-lightning channel confirmation..."
wait-for-docker c-lightning "cli listchannels | jq -e '.channels[] | select(.destination == \"${eclair_address}\" and .active == true)'"

echo -n "- Waiting for eclair channel confirmation..."
wait-for-docker eclair "cli channels | jq -e '.[] | select (.nodeId == \"${lnd2_address}\" and .state == \"NORMAL\")' > /dev/null"









