#!/bin/bash

set -e

clear

dfx stop
rm -rf .dfx
dfx start --clean --background
dfx canister create --all
echo
echo "==> deploy..."
echo
dfx deploy

echo 
echo "\033[32mdeploy success. \033[0m"
echo

function uint()
{
    sh test-case/uint.sh
}
function int()
{
    sh test-case/int.sh
}
function stack()
{
    sh test-case/stack.sh
}
function equeue()
{
    sh test-case/evicting-queue.sh
}
function all()
{
    uint
    int
    queue
    equeue
}

case $1 in
uint)
    uint
    ;;
int)
    int
    ;;
stack)
    stack
    ;;
equeue)
    equeue
    ;;
*)
    all
    ;;
esac

dfx stop
