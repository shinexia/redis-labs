#!/bin/bash

cd $(dirname $0) || exit $?

ROOT_DIR=$(pwd)

REDIS_SRC_DIR=${ROOT_DIR}/redis
REDIS_DST_DIR=${ROOT_DIR}/dist

function build_redis() {
    cd ${REDIS_SRC_DIR}
    make -j$(nproc)
    make PREFIX=${REDIS_DST_DIR} install
}

function clean_all() {
    rm -frv dist
}

case $1 in

build)
    build_redis
    ;;

clean)
    clean_all
    ;;

*)
    echo "usage $0 build|clean"
    exit 1
    ;;

esac
