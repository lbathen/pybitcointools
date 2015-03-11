#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

if  [ $# -eq 1 ];
then
    SIGNED_RAW_TX=$1
else
    SIGNED_RAW_TX=0100000001013f65944ea80381aa4c5c2304fa16bf0c2ca2d47539e87de74515d921105f050000000000ffffffff01e0aa029500000000096d010101029301039d00000000
fi

$CLI -regtest sendrawtransaction $SIGNED_RAW_TX
