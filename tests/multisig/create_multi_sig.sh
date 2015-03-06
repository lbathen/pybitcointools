#!/bin/sh
CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

P1=""
P2=""
P3=""
if  [ $# -eq 3 ];
then
    P1=$1
    P2=$2
    P3=$3
fi

$CLI -regtest createmultisig 2 '''["'$P1'","'$P2'", "'$P3'"]'''

exit 0

#bitcoin-cli -regtest getnewaddress
NEW_ADDRESS1=n2m2xdTtBLBcinHehd5qAgVyoif9TYZyE4
NEW_ADDRESS2=mqae5ddBsSRQTYreh58iHZxvaGaAgaxT5U
NEW_ADDRESS3=my5BLdtnabquyiKxtrC8kQdmVaPHaJdag3

NEW_ADDRESS3_PUBLIC_KEY=0264edb10e2dd55664e38c1fa6b24aaa1d59bd608e61b429af60d92d118ac1cc7f


if  [ $# -eq 4 ];
then
    NEW_ADDRESS1=$1
    NEW_ADDRESS2=$2
    NEW_ADDRESS3=$3
    NEW_ADDRESS3_PUBLIC_KEY=$4
fi

$CLI -regtest createmultisig 2 '''["'$NEW_ADDRESS1'","'$NEW_ADDRESS2'", "'$NEW_ADDRESS3_PUBLIC_KEY'"]'''

exit 0

