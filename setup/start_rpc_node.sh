#!/bin/bash
exec /home/solana/.local/share/solana/install/active_release/bin/agave-validator \
    --identity /home/solana/validator-keypair.json \
    --only-known-rpc \
    --full-rpc-api \
    --no-voting \
    --ledger /var/solana/ledger \
    --accounts /var/solana/accounts \
    --log /home/solana/solana-rpc.log \
    --rpc-port 8899 \
    --rpc-bind-address 0.0.0.0 \
    --private-rpc \
    --dynamic-port-range 8000-8020 \
    --entrypoint entrypoint.mainnet-beta.solana.com:8001 \
    --expected-genesis-hash 5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d \
    --wal-recovery-mode skip_any_corrupted_record \
    --limit-ledger-size