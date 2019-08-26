#!/bin/bash

echo 'Create Channel..'

peer channel create -o orderer.nmplus.com:7050 -c mychannel -f ./channel-artifacts/channel.tx \
--cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/nmplus.com/orderers/orderer.nmplus.com/msp/cacerts/ca.nmplus.com-cert.pem

# peer channel create -o orderer.nmplus.com:7050 -c mychannel2 -f ./channel-artifacts/channel2.tx \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/nmplus.com/orderers/orderer.nmplus.com/msp/cacerts/ca.nmplus.com-cert.pem

# peer channel create -o orderer.nmplus.com:7050 -c mychannel3 -f ./channel-artifacts/channel3.tx \
# --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/nmplus.com/orderers/orderer.nmplus.com/msp/cacerts/ca.nmplus.com-cert.pem

echo 'Done'

echo 'Join Channel..'

# CORE_PEER_ADDRESS=peer0.org1.nmplus.com:7051 peer channel join -b ./channel-artifacts/genesis.block
# CORE_PEER_ADDRESS=peer1.org1.nmplus.com:7051 peer channel join -b ./channel-artifacts/genesis.block
# CORE_PEER_ADDRESS=peer0.org2.nmplus.com:7051 peer channel join -b ./channel-artifacts/genesis.block
# CORE_PEER_ADDRESS=peer1.org2.nmplus.com:7051 peer channel join -b ./channel-artifacts/genesis.block

CORE_PEER_ADDRESS=peer0.org1.nmplus.com:7051 peer channel join -b mychannel.block
CORE_PEER_ADDRESS=peer1.org1.nmplus.com:7051 peer channel join -b mychannel.block

echo 'Done'
