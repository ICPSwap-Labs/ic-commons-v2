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

testId=`dfx canister id Test`
testIc0Id=`dfx canister id TestIC0`
echo "==> testId (\"$testId\")"
echo "==> testIc0Id (\"$testIc0Id\")"

dfx canister deposit-cycles 50698725619460 TestIC0

function text_ic0()
{
    echo "==> create canister"
    newCid=`dfx canister call TestIC0 create_canister`
    newCid=$(echo $newCid | sed 's/.*"\(.*\)".*/\1/')
    echo "==> create canister result: $newCid"
    
    echo "==> deposit cycles"
    result=`dfx canister call TestIC0 deposit_cycles "(principal \"$newCid\", 1000000000000)"`
    echo "==> deposit cycles result: $result"

    echo "==> canister status"
    result=`dfx canister call TestIC0 canister_status "(principal \"$newCid\")"`
    echo "==> canister status result: $result"

    echo "==> add controller natively"
    dfx canister update-settings Test --add-controller $testIc0Id
    result=`dfx canister call TestIC0 canister_status "(principal \"$testId\")"`
    echo "==> canister status result: $result"

    echo "==> stop"
    dfx canister call TestIC0 stop_canister "(principal \"$testId\")"
    result=`dfx canister call TestIC0 canister_status "(principal \"$testId\")"`
    echo "==> canister status result: $result"

    echo "==> start"
    dfx canister call TestIC0 start_canister "(principal \"$testId\")"
    result=`dfx canister call TestIC0 canister_status "(principal \"$testId\")"`
    echo "==> canister status result: $result"

    echo "==> add controller by canister"
    dfx canister call TestIC0 update_settings_add_controller "(principal \"$testId\", vec {principal \"aaaaa-aa\";})"
    result=`dfx canister call TestIC0 canister_status "(principal \"$testId\")"`
    echo "==> canister status result: $result"

    echo "==> remove controller by canister"
    dfx canister call TestIC0 update_settings_remove_controller "(principal \"$testId\", vec {principal \"aaaaa-aa\";})"
    result=`dfx canister call TestIC0 canister_status "(principal \"$testId\")"`
    echo "==> canister status result: $result"
}

text_ic0

dfx stop
