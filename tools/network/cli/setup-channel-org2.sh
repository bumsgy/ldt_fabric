#!/bin/bash


echo 'Join Channel..'

CORE_PEER_ADDRESS=peer0.org2.nmplus.com:7051 peer channel join -b ./channel-artifacts/genesis.block
CORE_PEER_ADDRESS=peer1.org2.nmplus.com:7051 peer channel join -b ./channel-artifacts/genesis.block

echo 'Done'
