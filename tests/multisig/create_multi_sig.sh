#!/bin/sh

NEW_ADDRESS1=n2m2xdTtBLBcinHehd5qAgVyoif9TYZyE4
NEW_ADDRESS2=mqae5ddBsSRQTYreh58iHZxvaGaAgaxT5U
NEW_ADDRESS3=my5BLdtnabquyiKxtrC8kQdmVaPHaJdag3

NEW_ADDRESS3_PUBLIC_KEY=0264edb10e2dd55664e38c1fa6b24aaa1d59bd608e61b429af60d92d118ac1cc7f

bitcoin-cli -regtest createmultisig 2 '''["'$NEW_ADDRESS1'","'$NEW_ADDRESS2'", "'$NEW_ADDRESS3_PUBLIC_KEY'"]'''

