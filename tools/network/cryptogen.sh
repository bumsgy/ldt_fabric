#!/bin/bash

echo 'delete old key data... '
rm -rf ./crypto-artifacts

cryptogen generate --config=./crypto-config/crypto-config.yaml --output=./crypto-artifacts

echo 'Generating crypto-material complete, now renaming keys...'
# Rename the key files we use to be key.pem instead of a uuid
for KEY in $(find ./crypto-artifacts -type f -name "*_sk"); do
    KEY_DIR=$(dirname ${KEY})
    mv ${KEY} ${KEY_DIR}/key.pem
done
echo 'Renaming keys complete'
