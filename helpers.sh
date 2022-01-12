#!/bin/bash

function run-in-docker() {
  echo ${@:2}
  docker-compose exec "$1" /bin/bash -c "${@:2}"
}

function wait-for-cmd() {
  until "${@}" > /dev/null 2>&1
  do 
    echo -n "."
    sleep 1
  done
  echo ok
}

function wait-for-docker() {
  wait-for-cmd run-in-docker $1 "${@:2}"
}
