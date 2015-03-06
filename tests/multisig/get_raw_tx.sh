#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

UTXO_TXID=066a1e44d4f9c3da67b0a7d8e97b0d43c0f1156ec1d2454ac03c88df750168f0

if  [ $# -eq 1 ];
then
    UTXO_TXID=$1
fi

$CLI -regtest getrawtransaction $UTXO_TXID
