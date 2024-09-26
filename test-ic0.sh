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

function text_ic0()
{
    echo "==> add controller natively"
    dfx canister update-settings Test --add-controller $testIc0Id
    dfx canister call TestIC0 canister_status "(principal \"$testId\")"

    echo "==> stop"
    dfx canister call TestIC0 stop_canister "(principal \"$testId\")"
    dfx canister call TestIC0 canister_status "(principal \"$testId\")"

    echo "==> start"
    dfx canister call TestIC0 start_canister "(principal \"$testId\")"
    dfx canister call TestIC0 canister_status "(principal \"$testId\")"

    echo "==> add controller by canister"
    dfx canister call TestIC0 update_settings_add_controller "(principal \"$testId\", vec {principal \"aaaaa-aa\";})"
    dfx canister call TestIC0 canister_status "(principal \"$testId\")"

    echo "==> remove controller by canister"
    dfx canister call TestIC0 update_settings_remove_controller "(principal \"$testId\", vec {principal \"aaaaa-aa\";})"
    dfx canister call TestIC0 canister_status "(principal \"$testId\")"
}

text_ic0

dfx stop
