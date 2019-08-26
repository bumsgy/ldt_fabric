#!/bin/bash

export FABRIC_CFG_PATH=$PWD

#genesis.block
echo 'delete old file'
rm -rf ./channel-artifacts

echo 'mkdir'
mkdir ./channel-artifacts

#orderer genesis block
configtxgen -profile TwoOrgOrdererGenesis -outputBlock ./channel-artifacts/genesis.block

# BSSeo : one channel
#channel configuration transaction:
configtxgen -profile TwoOrgChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID mychannel

# configtxgen -profile OneOrgAnotherChannel -outputCreateChannelTx ./channel-artifacts/channel2.tx -channelID mychannel2
# configtxgen -profile OneOrgAnotherChannelB -outputCreateChannelTx ./channel-artifacts/channel3.tx -channelID mychannel3

#two anchor peer transactions - one for each Peer Org.
#./bin/configtxgen -profile OneOrgChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID mychannel -asOrg Org1MSP
# configtxgen -profile OneOrgChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID mychannel -asOrg Org1MSP
# configtxgen -profile OneOrgChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID mychannel -asOrg Org2MSP
