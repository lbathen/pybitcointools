#!/bin/sh
CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

UTXO1_TXID=e4f4301230b93ba786741cf5bf925dfc5c4f654148ae1fccf7dcfb2cac793a17
UTXO1_VOUT=0
UTXO1_ADDRESS=ms5ejA7RXE9euCRnTNP23SesHxQPpVEbrc

UTXO2_TXID=f687ca25af917f26f908c67e402e8b4fa2fd01cc2adfc9a50885bb1cdab33dc6
UTXO2_VOUT=0
UTXO2_ADDRESS=mhYSYm3aTSdP8P1XQhDu7oH1FiFq6duobW

UTXO1_PRIVATE_KEY=cVhquZAcJdkpYZUFAhHAoZsegGRivsGz3rfJYno6BjSdo5rhTZVg
UTXO2_PRIVATE_KEY=cVZokyzworVsVsTbLnVDWN66gmTWiRVjgco9R3gMMXneTwTn2fRm

# From target server(s)
NEW_ADDRESS1=n1gk5SrHAzsSZr2MjnR8vXbjtge8DBxGE9
NEW_ADDRESS2=mpC3EM2jMpeRYqGNmpmXPsMNdr1RKbpJD1


$CLI -regtest createrawtransaction '''[{"txid": "'$UTXO1_TXID'", "vout": '$UTXO1_VOUT'}, {"txid": "'$UTXO2_TXID'","vout": '$UTXO2_VOUT'}]''' '''{"'$NEW_ADDRESS1'": 89.9999, "'$NEW_ADDRESS2'": 10.00 }'''
