#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

RAW_TX=010000000156970f8f15d60ac172859dea90d4f2081dbf3f92e52a8a6a28b86eb0d5ce596f0100000000ffffffff01f0a29a3b000000001976a914ab423216fddcfabcfde225666621e2b3607e4e2b88ac00000000

UTXO_TXID=6f59ced5b06eb8286a8a2ae5923fbf1d08f2d490ea9d8572c10ad6158f0f9756
UTXO_VOUT=1
UTXO_OUTPUT_SCRIPT=76a9145f2559657d3adfb77e0a5078a8fbc7fe3c7f919188ac

$CLI -regtest signrawtransaction $RAW_TX '''[{"txid": "'$UTXO_TXID'", "vout": '$UTXO_VOUT', "scriptPubKey": "'$UTXO_OUTPUT_SCRIPT'"}]'''


