#!/bin/sh

UTXO_TXID=5a791ff48a4d8f4b84a097479bdc6e0790a88130f8891c0edb1989982ab92c98

bitcoin-cli -regtest getrawtransaction $UTXO_TXID 1

