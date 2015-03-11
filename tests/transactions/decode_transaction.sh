#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

if  [ $# -eq 1 ];
then
    RAW_TX=$1
else
    RAW_TX=0100000001f2d6ab87fd907e6f32fc0f35125dcf3af888f1fd008590b7377781048674b03b0000000000ffffffff01f0ca052a010000001976a914d4708a1f1e85d48895e4cb8310e576cc903618c088ac00000000
fi

$CLI -regtest decoderawtransaction $RAW_TX
