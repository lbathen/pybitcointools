#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

P2SH_ADDRESS=2N22WaMyb9KpMe6fRHMRC7ict4APW7JzmyE
P2SH_REDEEM_SCRIPT=522103fc827716cf22aaf09fb0b69f3f43208515cceba28943c4d09f02ca90ed88edab210392959b2ba7e94044dc6a5682a049c7974f985dca871d9b60de0aad85ac3e5a84210264edb10e2dd55664e38c1fa6b24aaa1d59bd608e61b429af60d92d118ac1cc7f53ae
AMOUNT=0.01
if  [ $# -eq 2 ];
then
    P2SH_ADDRESS=$1
    #P2SH_REDEEM_SCRIPT=$2
    AMOUNT=$2
fi

$CLI -regtest sendtoaddress $P2SH_ADDRESS $AMOUNT
