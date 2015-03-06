#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

RAW_TX=01000000015a3ad3364248df5449438a4b1731f2e68a0d9d413e65f7067359377d07dfe33500000000b500483045022100c861409379c9a8dbedac139229420eee6aaf36a96ba93a2db6e1d4d052c61e750220313af6fa63083b97b2212d11c75c95f310ac760e40bf6ace2737dc5410367ca2014c695221022a06b9d436e84933e50b46d33026b922137e7092bd2a1bd66a789f98217206ad2102ebb7a95ed9607dd728a4ca2a0ac386804cd49bb725e686086186be894c7f350f210245ea3d5443348b2c42c420848bcbb7a7d5fe344337d65300c0207b53d26e09eb53aeffffffff0140420f00000000001976a9149080e2324077c017107cdab070ccaf87651ea79d88ac00000000
UTXO_TXID=35e3df077d37597306f7653e419d0d8ae6f231174b8a434954df484236d33a5a
UTXO_VOUT=0
UTXO_OUTPUT_SCRIPT=a914de0b761d40de5db15f1f42d05b85b7fc2699dbf487
P2SH_REDEEM_SCRIPT=5221022a06b9d436e84933e50b46d33026b922137e7092bd2a1bd66a789f98217206ad2102ebb7a95ed9607dd728a4ca2a0ac386804cd49bb725e686086186be894c7f350f210245ea3d5443348b2c42c420848bcbb7a7d5fe344337d65300c0207b53d26e09eb53ae

NEW_ADDRESS1_PRIVATE_KEY=cVmjW1GRyBj9dM6t3RpG5hzBNT6e73WKfz8FMuW2MifM6rVv73Ah
NEW_ADDRESS3_PRIVATE_KEY=cRFYoga25udfhLU6z5Qn7zjxP6AvRBKP5symazbiNe9KW5Q7SJvr

if  [ $# -eq 5 ];
then
    RAW_TX=$1
    UTXO_TXID=$2
    UTXO_VOUT=0
    UTXO_OUTPUT_SCRIPT=$3
    P2SH_REDEEM_SCRIPT=$4
    NEW_ADDRESS3_PRIVATE_KEY=$5
fi

$CLI -regtest signrawtransaction $RAW_TX '''[{"txid": "'$UTXO_TXID'", "vout": '$UTXO_VOUT', "scriptPubKey": "'$UTXO_OUTPUT_SCRIPT'", "redeemScript": "'$P2SH_REDEEM_SCRIPT'"}]''' '''["'$NEW_ADDRESS3_PRIVATE_KEY'"]'''

