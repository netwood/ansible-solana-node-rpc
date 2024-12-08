#!/bin/bash
exec /home/solana/.local/share/solana/install/active_release/bin/agave-validator \
    --identity /home/solana/validator-keypair.json \
    --only-known-rpc \
    --full-rpc-api \
    --no-voting \
    --ledger /mnt/solana/ledger \
    --accounts /mnt/solana/accounts \
    --log /home/solana/solana-rpc.log \
    --rpc-port 8899 \
    --rpc-bind-address 0.0.0.0 \
    --private-rpc \
    --dynamic-port-range 8000-8020 \
    --entrypoint entrypoint.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint2.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint3.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint4.mainnet-beta.solana.com:8001 \
    --entrypoint entrypoint5.mainnet-beta.solana.com:8001 \
    --expected-genesis-hash 5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d \
    --known-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
    --known-validator GdnSyH3YtwcxFvQrVVJMm1JhTS4QVX7MFsX56uJLUfiZ \
    --known-validator DE1bawNcRJB9rVm3buyMVfr8mBEoyyu73NBovf2oXJsJ \
    --known-validator CakcnaRDHka2gXyfbEd2d3xsvkJkqsLw2akB3zsN1D2S \
    --known-validator 9QxCLckBiJc783jnMvXZubK4wH86Eqqvashtrwvcsgkv \
    --known-validator Ft5fbkqNa76vnsjYNwjDZUXoTWpP7VYm3mtsaQckQADN \
    --known-validator 9QU2QSxhb24FUX3Tu2FpczXjpK3VYrvRudywSZaM29mF \
    --repair-validator 7Np41oeYqPefeNQEHSv1UDhYrehxin3NStELsSKCT4K2 \
    --repair-validator DE1bawNcRJB9rVm3buyMVfr8mBEoyyu73NBovf2oXJsJ \
    --accounts-db-cache-limit-mb 32768 \
    --accounts-index-memory-limit-mb 128000 \
    --limit-ledger-size \
    --maximum-local-snapshot-age 1500 \
    --snapshot-interval-slots 1000 \
    --snapshot-archive-format zstd \
    --rpc-send-leader-count 4 \
    --rpc-threads 32 \
    --tpu-connection-pool-size 8 \
    --accounts-index-scan-results-limit-mb 32768 \
    --rocksdb-fifo-shred-storage-size 50000000000 \
    --account-index program-id \
    --account-index spl-token-owner \
    --account-index spl-token-mint \
    --health-check-slot-distance 50 \
    --use-snapshot-archives-at-startup when-newest \
    --wal-recovery-mode skip_any_corrupted_record \
    --minimal-snapshot-download-speed 10485760