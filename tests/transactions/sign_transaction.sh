#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

if  [ $# -eq 1 ];
then
    RAW_TX=$1
else
    RAW_TX=0100000001f0ca71d72800c9074835973deb38b24c6f86809a66005a26a8de0c9e2e1f928e0000000000ffffffff0100f2052a0100000008010101029301039d00000000

fi

#bitcoin-cli -regtest decoderawtransaction $RAW_TX
$CLI -regtest signrawtransaction $RAW_TX

