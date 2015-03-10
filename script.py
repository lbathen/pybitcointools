from subprocess import call, Popen, PIPE
from bitcoin import *

import json

CLI="/Users/labathen/Development/maidenlane/bitcoin-danny/src/bitcoin-cli -regtest "
SHELL="sh /Users/labathen/Development/maidenlane/pybitcointools-danny/tests/transactions/"

TXID1='bc3361254ae7d953d1dc2c1f955ddb47c30a0a9700d9d6e430a9c3bb3ad3a3f5'
TXID2='72a8a8c832f9d09c012b9bf64db3cab1b75cd7a2a7f3475858ef1873168928f7'

MULTI_SIG_ADDR=None
REDEEM_SCRIPT=None

ADDRESS1=None
ADDRESS2=None
ADDRESS3=None
ADDRESS4=None
FUNDING='12.50'


################ Util ###############
def get_json_from_shell(cmd):
    print "Executing %s" % cmd
    code =  Popen([cmd, ""], stdout=PIPE, shell=True)
    (out, err) = code.communicate()
    json_buffer = json.loads(out.replace('\n',''))
    return json_buffer

def execute_cmd_blocking(cmd):
    print "Executing %s" % cmd
    code =  Popen([cmd, ""], stdout=PIPE, shell=True)
    (out, err) = code.communicate()
    data_buffer = out.split('\n')
    return data_buffer


############### CLI ######################
def get_new_addr():
    cmd = CLI + 'getnewaddress'
    buffer = execute_cmd_blocking(cmd)
    return buffer[0]

def validate_addr(addr):
    cmd = CLI + 'validateaddress  ' + addr
    return get_json_from_shell(cmd)

def get_pub_key(addr):
    va_json = validate_addr(addr1)
    try:
        return va_json['pubkey']
    except:
        print("Unable to get public key for address %s" % s)
        return None

def get_priv_key(addr):
    cmd = CLI + 'dumpprivkey ' + addr
    buffer = execute_cmd_blocking(cmd)
    return buffer[0]


################ Scripts ##################
def create_multi_sig(addr1, addr2, addr3): #, addr3_pk)
    cmd = SHELL + 'create_multi_sig.sh ' + addr1 + ' ' + addr2 + ' ' + addr3 #+ ' ' +  addr3_pk
    msig_json = get_json_from_shell(cmd)
    #print msig_json['address']
    #print msig_json['redeemScript']
    return msig_json

def send_to_multisig(addr, amount):
    cmd = SHELL + 'send_to_multisig_addr.sh ' + addr + ' ' + amount
    buffer = execute_cmd_blocking(cmd)
    return buffer[0]

def create_raw_tx(txid, addr, amount):
    cmd = SHELL + 'create_raw_transaction.sh ' + txid + ' ' + addr + ' ' + amount
    buffer = execute_cmd_blocking(cmd)
    return buffer[0]

def sign_raw_tx(txid):
    cmd = SHELL + 'sign_transaction.sh ' + txid
    buffer = get_json_from_shell(cmd)
    print buffer
    return buffer['hex']

def get_tx_info(txid):
    #cmd = SHELL + 'decode_raw_multisig_transaction.sh ' + txid
    cmd = SHELL + 'get_tx_info.sh ' + txid
    
    tx_json = get_json_from_shell(cmd)
    txid = tx_json['txid']
    
    for key, value in tx_json.iteritems():
        if key == 'vout':
            for vouts in value:
                if vouts['value'] == 10.00000000:
                    script_pub_key = vouts['scriptPubKey']
                    script_hex = script_pub_key['hex']
                    n = vouts['n']
                    return {'txid':txid, 'scriptPubKey':script_hex, 'vout':n}
    return None

def get_raw_tx(txid):
    cmd = SHELL + 'get_raw_tx.sh ' + txid
    buffer = execute_cmd_blocking(cmd)
    print buffer
    return buffer[0]


#def create_raw_multisig(txid, pubk, redeem, amount, addr, vout):
def create_raw_multisig(txid, addr, amount, vout):
    cmd = SHELL + 'create_raw_multisig_tx.sh ' + txid + ' ' + addr + ' ' + amount + ' ' + vout
    buffer = execute_cmd_blocking(cmd)
    return buffer[0]

def sign_multi_sig_piv(multi_sig_tx_id, signed_tx, script_pub_k, msig_redeem_script, privk_addr):
    cmd = SHELL + 'sign_multisig_raw_transaction.sh ' + multi_sig_tx_id + ' ' + signed_tx + ' ' + script_pub_k + ' ' + msig_redeem_script + ' ' + privk_addr
    buffer = get_json_from_shell(cmd)
    print buffer
    return buffer['hex']

def send_signed_tx(raw_tx):
    cmd = SHELL + 'send_single_transaction.sh ' + raw_tx
    buffer = execute_cmd_blocking(cmd)
    return buffer[0]

def gen_raw_transaction(txid, addr, amount):
    cmd = SHELL + 'gen_transaction.sh ' + txid + ' ' + addr + ' ' + amount
    buffer = execute_cmd_blocking(cmd)
    return buffer[0]

def custom_locking_script():
    quickfix = 0xff

    # construct it
    asm = quickfix  

    # add extra content
    #asm = asm << 8 | op_return

    #OP_2DUP OP_ADD OP_8 OP_EQUALVERIFY OP_SUB OP_2 OP_EQUAL
    #asm = asm << 8 | 0x6e
    asm = asm << 8 | 0x93 
    asm = asm << 8 | 0x58
    asm = asm << 8 | 0x9d 
    asm = asm << 8 | 0x94
    asm = asm << 8 | 0x52

    asm = asm << 8 | 0x61 #NOP
    
    asm = asm << 8 | 0x9d 

    #asm = asm << 8 | op_return

    almost  = hex(asm)
    ready = almost.partition("0xff")[2]
    print('Updated Script: %s' % ready)
    return ready

def custom_unlocking_script():
    quickfix = 0xff

    # construct it
    asm = quickfix  

    #OP_2DUP OP_ADD OP_8 OP_EQUALVERIFY OP_SUB OP_2 OP_EQUAL
    asm = asm << 8 | 0x55
    asm = asm << 8 | 0x53
    #asm = asm << 8 | 0x61

    almost  = hex(asm)
    ready = almost.partition("0xff")[2]
    print('Updated Script: %s' % ready)
    return ready    

def modify_pub_key_script(tx):
    json_tx = deserialize(tx)
    print json_tx

    for key, element in json_tx.iteritems():
        print ('%s -> %s' % (key, element))
        if key == 'outs':
            element[0]['script'] = str(custom_locking_script())[:-1]

    print json_tx

    serialized_tx = serialize(json_tx)

    print serialized_tx
    return serialized_tx

def modify_sig_script(tx):
    json_tx = deserialize(tx)
    print json_tx

    for key, element in json_tx.iteritems():
        print ('%s -> %s' % (key, element))
        if key == 'ins':
            element[0]['script'] = str(custom_unlocking_script()) #[:-1] - Might need this in case we have a long

    print json_tx

    serialized_tx = serialize(json_tx)

    print serialized_tx
    return serialized_tx


################ Main methods ###########
def multi_sig():
    addr1 = get_new_addr()
    addr2 = get_new_addr()
    addr3 = get_new_addr()
    addr4 = get_new_addr()

    #addr1 = 'n2m2xdTtBLBcinHehd5qAgVyoif9TYZyE4'
    pubk_addr1 = get_pub_key(addr1)
    pubk_addr2 = get_pub_key(addr2)
    pubk_addr3 = get_pub_key(addr3)

    privk_addr1 = get_priv_key(addr1)
    privk_addr2 = get_priv_key(addr2)
    privk_addr3 = get_priv_key(addr3)

    # generate the multi sig
    msig = create_multi_sig(pubk_addr1, pubk_addr2, pubk_addr3)
    msig_addr = msig['address']
    msig_redeem_script = msig['redeemScript']
    
    # create new tx
    #paid_raw_tx = create_raw_tx(TXID1, msig_addr, FUNDING)
    
    # sign it
    #signed_tx = sign_raw_tx(paid_raw_tx)
    signed_tx = send_to_multisig(msig_addr, FUNDING)
   
    print ('--- Signed Tx: %s\n' % signed_tx)

    signed_tx_json = get_tx_info(signed_tx)
    
    # get tx info from json
    signed_txid = signed_tx_json['txid']
    script_pub_k = signed_tx_json['scriptPubKey']
    vout = signed_tx_json['vout']
    
    print ('--- Signed Tx Id: %s\n' % signed_txid )
    print ('--- Tx vout: %s\n' % vout )
    print ('--- Signed Tx scriptPubKey: %s\n' % script_pub_k )

    # now we need to create yet another raw tx
    #multi_sig_tx_id = create_raw_multisig(signed_txid, script_pub_k, msig_redeem_script, str(float(FUNDING)-0.002), addr4, vout)
    multi_sig_tx_id = create_raw_multisig(signed_txid, addr4, str(float(FUNDING)-0.002), str(vout))

    print ('--- Signed MultiSig Tx Id: %s\n' % multi_sig_tx_id )
    
    # now we need to sign the txs
    signed_multi_sig_1 = sign_multi_sig_piv(multi_sig_tx_id, signed_tx, script_pub_k, msig_redeem_script, privk_addr1)

    signed_multi_sig_2 = sign_multi_sig_piv(signed_multi_sig_1, signed_tx, script_pub_k, msig_redeem_script, privk_addr3)

    # now send the spend tx then the signed multisig

    sig_raw_txid = send_signed_tx(get_raw_tx(signed_tx))
    sig_multisig_raw_txid = send_signed_tx(signed_multi_sig_2)

    print ('**********\nMulti-Sig: %s\nSpend: %s\n**********\n' % (sig_multisig_raw_txid, sig_raw_txid))

def custom_script():
    addr1 = get_new_addr()
    addr2 = get_new_addr()

    # Generate raw transaction
    raw_tx = gen_raw_transaction(TXID1, addr1, FUNDING)

    # Modify and embed custom script (locking script - pubKey)
    modified_tx = modify_pub_key_script(raw_tx)

    # Sign the tx
    signed_tx = sign_raw_tx(modified_tx)

    # Get txid of sent tx
    mod_txid = send_signed_tx(signed_tx)

    # Now, let's create a custom script, modify the unlocking script (pubSig)
    raw_tx_2 = gen_raw_transaction(mod_txid, addr2, str(float(FUNDING)-0.005))

    # Now, modify the pubSig
    modified_tx_2 = modify_sig_script(raw_tx_2)

    # Check the tx
    signed_tx_2 = sign_raw_tx(modified_tx_2)

    # Send it
    mod_txid_2 = send_signed_tx(signed_tx_2)

    # generate



############### Main ###########
if __name__ == "__main__":
    custom_script()

