#!/bin/sh

UTXO_TXID=5a791ff48a4d8f4b84a097479bdc6e0790a88130f8891c0edb1989982ab92c98
UTXO_VOUT=0
UTXO_OUTPUT_SCRIPT=a91460519236d22f3dcbecfffa0162173b68084c381a87

NEW_ADDRESS4=mvY7JgqHADkD2J499Gx7bbbLhcE7fnNM5p

bitcoin-cli -regtest createrawtransaction '''[{"txid": "'$UTXO_TXID'","vout": '$UTXO_VOUT'}]''' '''{"'$NEW_ADDRESS4'": 49.998}'''


