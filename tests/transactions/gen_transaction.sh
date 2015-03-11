#!/bin/sh

#btcli="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli -regtest"
CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

#Get transactions with:
#bitcoin-cli -regtest listunspent

AMOUNT=25.00
#AMOUNT=49.00

if  [ $# -eq 2 ];
then
    UTXO_VOUT=0
    UTXO_TXID=$1
    NEW_ADDRESS=$2
else
    UTXO_TXID=055f1021d91545e77de83975d4a22c0cbf16fa04235c4caa8103a84e94653f01
    UTXO_VOUT=0
    NEW_ADDRESS=n3HAvb4Smqzw8bWxdcvXcSEaSGnNCQ4i4D
fi

if  [ $# -eq 3 ];
then
    UTXO_TXID=$1
    NEW_ADDRESS=$2
    AMOUNT=$3
fi

$CLI -regtest createrawtransaction ''' [ { "txid": "'$UTXO_TXID'", "vout": '$UTXO_VOUT'} ] ''' ''' { "'$NEW_ADDRESS'": '$AMOUNT' }'''


