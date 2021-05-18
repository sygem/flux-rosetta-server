#!/bin/sh

DATA_DIR="$ROOTDATADIR"
NODE_DIR="$ROSETTADIR"

# Switch to rosetta directory
cd "${NODE_DIR}"

# Run both online and offline in this single container
concurrently --restart-tries 10000000 \
        "RPC_PORT=$RPC_PORT RPC_USER=$RPC_USER RPC_PASS=$RPC_PASS RPC_HOST=$RPC_HOST DATA_PATH=\"$DATA_DIR\" CONNECTION=\"$CONNECTION\" PORT=\"$ONLINE_PORT\" FLUX_NETWORK=\"$NETWORK\" FLUX_VERSION=\"$VERSION\" npm run start > online.log" \
        "RPC_PORT=$RPC_PORT RPC_USER=$RPC_USER RPC_PASS=$RPC_PASS RPC_HOST=$RPC_HOST DATA_PATH=\"$DATA_DIR\" CONNECTION=\"$CONNECTION\" PORT=\"$OFFLINE_PORT\" OFFLINE_MODE=1 FLUX_NETWORK=\"$NETWORK\" FLUX_VERSION=\"$VERSION\" npm run start > offline.log"


