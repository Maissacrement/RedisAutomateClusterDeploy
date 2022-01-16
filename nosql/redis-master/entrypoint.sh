#!/bin/sh
set -e

sed_conf () {
    sed -i "s/\${PORT}/${PORT:-6379}/g" /app/sentinel.conf
    sed -i "s/\${HOST}/${HOST:-'127.0.0.1'}/g" /app/sentinel.conf
    sed -i "s/\${QUORUM}/${QUORUM:-2}/g" /app/sentinel.conf
}

redis_server () {
    redis-server /app/node.conf --port ${PORT:-6379} >> /tmp/redis 2>&1 &
}

redis_sentinel () {
    redis-sentinel /app/sentinel.conf --port ${SENTINEL_PORT:-26379} >> /tmp/redis 2>&1 &
}

main () {
    echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
    sed_conf && redis_server && sleep 5 && redis_sentinel && tail -f /tmp/redis
}

main