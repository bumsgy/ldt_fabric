#!/bin/bash

echo 'Install ChainCode'
CHAINCODE_DIR=github.com/hyperledger/fabric/nmpluss/chaincode/go/
CORE_PEER_ADDRESS=peer0.org1.nmplus.com:7051 peer chaincode install -n $1 -v $2 -p $CHAINCODE_DIR/$1_cc

echo 'Done'

echo 'Upgrade ChainCode'

CORE_PEER_ADDRESS=peer0.org1.nmplus.com:7051 peer chaincode upgrade -o orderer.nmplus.com:7050 \
--cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/nmplus.com/orderers/orderer.nmplus.com/msp/cacerts/ca.nmplus.com-cert.pem \
-C mychannel -n $1 -v $2  -c '{"Args":["init","a","200","b","200"]}' -P "OR   ('Org1MSP.member')"

echo 'Done'
