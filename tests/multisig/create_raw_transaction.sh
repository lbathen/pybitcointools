#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

UTXO_TXID=5a791ff48a4d8f4b84a097479bdc6e0790a88130f8891c0edb1989982ab92c98
UTXO_VOUT=0
UTXO_OUTPUT_SCRIPT=a91460519236d22f3dcbecfffa0162173b68084c381a87

NEW_ADDRESS4=mvY7JgqHADkD2J499Gx7bbbLhcE7fnNM5p
AMOUNT=0.01

if  [ $# -eq 3 ];
then
    UTXO_TXID=$1
    NEW_ADDRESS4=$2
    AMOUNT=$3
fi

$CLI -regtest createrawtransaction '''[{"txid": "'$UTXO_TXID'","vout": '$UTXO_VOUT'}]''' '''{"'$NEW_ADDRESS4'": '$AMOUNT'}'''
