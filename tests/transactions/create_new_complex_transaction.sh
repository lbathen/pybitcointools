#!/bin/sh

UTXO_TXID=6f59ced5b06eb8286a8a2ae5923fbf1d08f2d490ea9d8572c10ad6158f0f9756
UTXO_VOUT=1
UTXO_OUTPUT_SCRIPT=76a9145f2559657d3adfb77e0a5078a8fbc7fe3c7f919188ac

NEW_ADDRESS=mw8V9DGaGfv23GN3Egy1DpvFr2up3a9ijx

bitcoin-cli -regtest createrawtransaction '''[{"txid": "'$UTXO_TXID'","vout": '$UTXO_VOUT'}]''' '''{"'$NEW_ADDRESS'": 9.9999}'''

