#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"


UTXO_TXID=8b64a35b1565155de3cd02e391d8bfdc847659bd5416b8d3cfb692bd701c4103
UTXO_VOUT=1
SCRIPT_PUB_KEY=a914e029c792f8d65731b9bc49d3e61554ead7874e0587
REDEEM_SCRIPT=a914b8b8b9acfc6ff079a2a9eaa37ac477a37fbc9b4e87
NEW_ADDRESS4=n45UeWUkPxqrK9iFtDFgW7U6RGXWZVQfVD
AMOUNT=0.01

if  [ $# -eq 4 ];
then
    UTXO_TXID=$1
    NEW_ADDRESS4=$2
    AMOUNT=$3
    UTXO_VOUT=$4
fi

$CLI -regtest createrawtransaction '''[{"txid": "'$UTXO_TXID'", "vout": '$UTXO_VOUT'}]''' '''{"'$NEW_ADDRESS4'": '$AMOUNT'}'''

exit 0


if  [ $# -eq 5 ];
then
    UTXO_TXID=$1
    NEW_ADDRESS4=$2
    AMOUNT=$3
    SCRIPT_PUB_KEY=$4
    REDEEM_SCRIPT=$5
fi

$CLI -regtest createrawtransaction '''[{"txid": "'$UTXO_TXID'","vout": '$UTXO_VOUT',"scriptPubKey": "'$SCRIPT_PUB_KEY'","redeemScript": "'$REDEEM_SCRIPT'"}]''' '''{"'$NEW_ADDRESS4'": '$AMOUNT'}'''
