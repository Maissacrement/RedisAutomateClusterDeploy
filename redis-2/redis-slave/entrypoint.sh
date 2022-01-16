#!/bin/sh

sed_conf () {
    set -e

    sed -i "s/\${HOSTNAME}/${MASTER_HOST:-master}/g" /app/sentinel.conf
    sed -i "s/\${PORT}/${MASTER_PORT:-6379}/g" /app/sentinel.conf
    sed -i "s/\${HOST}/${MASTER_IP:-'127.0.0.1'}/g" /app/sentinel.conf
    sed -i "s/\${QUORUM}/${QUORUM:-2}/g" /app/sentinel.conf
}

redis_server () {
    if [ -z ${MASTER_IP} ];then    echo -e "\nMaster ip need be specified\n" && exit 1;fi
    redis-server --port 6380 --replicaof ${MASTER_IP} ${MASTER_PORT:-6379} >> /tmp/redis 2>&1 &
}

redis_sentinel () {
    redis-sentinel /app/sentinel.conf --port ${SENTINEL_PORT:-26380} >> /tmp/redis 2>&1 &
}

main () {
    echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
    sed_conf && redis_server && sleep 5 && redis_sentinel &&\
    tail -f /tmp/redis
}

main


