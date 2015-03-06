#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

UTXO_TXID=0100000001eaaa359cde083647ddd770a1b18137801c0cb929a30e3f7cae12e583a8fd01970000000048473044022043829e5f88d28fd0b7ce1a7d9bf7a25e29811a6a9ebafefe44f0b9273e18180f02200badec4221be28117affb22e2e86b2ef622844e3e80a212ea923d596872b983701ffffffff0140420f000000000017a914572e6f9da33a951a3252bb06b5304aaaf44d8cf08700000000

if  [ $# -eq 1 ];
then
    UTXO_TXID=$1
fi

$CLI -regtest getrawtransaction $UTXO_TXID 1
