#!/usr/bin/env bash

if [[ ${NETWORK} ]]; then
  network=${NETWORK}
else
  network="testnet"
fi

if [[ ${PORT} ]]; then
  port=${PORT}
else
  port="3001"
fi

if [[ ${DISABLEPOLLING} ]]; then
  disablePolling=${DISABLEPOLLING}
else
  disablePolling="true"
fi

if [[ ${ENABLESOCKERPC} ]]; then
  enableSocketRPC=${ENABLESOCKERPC}
else
  enableSocketRPC="false"
fi

if [[ ${DISABLERATELIMIT} ]]; then
  disableRateLimit=${DISABLERATELIMIT}
else
  disableRateLimit="false"
fi

if [[ ${DBHOST} ]]; then
  mongo_host=${DBHOST}
else
  mongo_host="mongo"
fi

if [[ ${DBPORT} ]]; then
  mongo_port=${DBPORT}
else
  mongo_port="27017"
fi

if [[ ${MONGODATABASE} ]]; then
  mongo_database=${MONGODATABASE}
else
  mongo_database="meowcoin-api"
fi

if [[ ${MONGOUSER} ]]; then
  mongo_user=${MONGOUSER}
else
  mongo_user="meowcoin"
fi

if [[ ${MONGOPASSWORD} ]]; then
  mongo_password=${MONGOPASSWORD}
else
  mongo_password="suNjvst7robCwemg"
fi

if [[ ${RPCHOST} ]]; then
  rpc_host=${RPCHOST}
else
  rpc_host="meowcoind"
fi

if [[ ${RPCPORT} ]]; then
  rpc_port=${RPCPORT}
else
  rpc_port="19766"
fi

if [[ ${RPCUSER} ]]; then
  rpc_user=${RPCUSER}
else
  rpc_user="meowcoin"
fi

if [[ ${RPCPASSWORD} ]]; then
  rpc_password=${RPCPASSWORD}
else
  rpc_password="2mbyzg96hzbC0bYWm2pNKs2bJ23jpJId1HIT5cwZP24="
fi

if [[ ${RPC_ZMQADDRESS} ]]; then
  rpc_zmqaddress=${RPC_ZMQADDRESS}
else
  rpc_zmqaddress="tcp://${rpc_host}:28332"
fi

printf '{
  "network": "%s",
  "port": "%s",
  "services": [
    "meowcoind",
    "web",
    "insight-api",
    "insight-ui"
  ],
  "messageLog": "",
  "servicesConfig": {
    "web": {
      "disablePolling": "%s",
      "enableSocketRPC": "%s"
    },
    "insight-ui": {
      "routePrefix": "",
      "apiPrefix": "api"
    },
    "insight-api": {
      "routePrefix": "api",
      "disableRateLimiter": "%s",
      "coinTicker": "https://api.coinmarketcap.com/v1/ticker/meowcoin/?convert=USD",
      "coinShort": "MEWC",
      "db": {
        "host": "%s",
        "port": "%s",
        "database": "%s",
        "user": "%s",
        "password": "%s"
      }
    },
    "meowcoind": {
      "connect": [ {
        "rpchost": "%s",
        "rpcport": "%s",
        "rpcuser": "%s",
        "rpcpassword": "%s",
        "zmqpubrawtx": "%s"
      } ]
    }
  }
}\n' \
"${network}" \
"${port}" \
"${disablePolling}" \
"${enableSocketRPC}" \
"${disableRateLimit}" \
"${mongo_host}" \
"${mongo_port}" \
"${mongo_database}" \
"${mongo_user}" \
"${mongo_password}" \
"${rpc_host}" \
"${rpc_port}" \
"${rpc_user}" \
"${rpc_password}" \
"${rpc_zmqaddress}" > ./meowcoincore-node.json

if [[ -e /app/bin/meowcoincored ]]; then
  /app/bin/meowcoincored -c /app/meowcoincore-node.json
else
  echo "unable to fine meowcoincored. $?"
  exit 1
fi
