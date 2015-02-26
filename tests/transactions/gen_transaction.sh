#!/bin/sh

btcli="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli -regtest"

#Get transactions with:
#bitcoin-cli -regtest listunspent

UTXO_TXID=78fd35aed60f8059472b9d6fdf1a07e99bba7f54c1668fd57876b2f22006e8aa
UTXO_VOUT=0
NEW_ADDRESS=mpjvp2nKiE4bSC9SW3vWXM8TKsmBHyLXNa

$btcli createrawtransaction ''' [ { "txid": "'$UTXO_TXID'", "vout": '$UTXO_VOUT'} ] ''' ''' { "'$NEW_ADDRESS'": 49.9999 }'''


