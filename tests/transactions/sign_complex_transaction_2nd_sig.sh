#!/bin/sh

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli"

UTXO1_PRIVATE_KEY=cVhquZAcJdkpYZUFAhHAoZsegGRivsGz3rfJYno6BjSdo5rhTZVg
UTXO2_PRIVATE_KEY=cVZokyzworVsVsTbLnVDWN66gmTWiRVjgco9R3gMMXneTwTn2fRm

PARTIALLY_SIGNED_RAW_TX=0100000002173a79ac2cfbdcf7cc1fae4841654f5cfc5d92bff51c7486a73bb9301230f4e40000000048473044022016bf0c9174ec9a6d4483e8cb8d5aec651623521657eda8e8d0aed72e4ca6924f022041ca84e920469e6bc3e1f4ca7bd92acecb924779312e7a53b1793950e34c119701ffffffffc63db3da1cbb8508a5c9df2acc01fda24f8b2e407ec608f9267f91af25ca87f60000000000ffffffff02f0f27018020000001976a914dd3c7a0c015b1208e340aece1b9322f9683fcf4f88ac00ca9a3b000000001976a9145f2559657d3adfb77e0a5078a8fbc7fe3c7f919188ac00000000

$CLI -regtest signrawtransaction $PARTIALLY_SIGNED_RAW_TX '[]' ''' ["'$UTXO2_PRIVATE_KEY'"]'''