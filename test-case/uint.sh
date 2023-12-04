#!/bin/bash

echo
echo "test uint8 ..."
echo

# test uint8 add
result=`dfx canister call Test testSafeUint8Add '(123, 255)'`
if [ "$result" = "(122 : nat)" ]; then
    echo "\033[32muint8 add success. 123 + 255 = 122. \033[0m"
else
    echo 
    echo "\033[31muint8 add fail. 123 + 255 = $result, expected '(122 : nat)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeUint8Add '(255, 8)'`
if [ "$result" = "(7 : nat)" ]; then
    echo "\033[32muint8 add success. 255 + 8 = 7. \033[0m"
else
    echo 
    echo "\033[31muint8 add fail. 255 + 8 = $result, expected '(7 : nat)' \033[0m"
    echo 
fi

# test uint8 sub
result=`dfx canister call Test testSafeUint8Sub '(123, 255)'`
if [ "$result" = "(124 : nat)" ]; then
    echo "\033[32muint8 sub success. 123 - 255 = 124. \033[0m"
else
    echo 
    echo "\033[31muint8 sub fail. 123 - 255 = $result, expected '(124 : nat)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeUint8Sub '(255, 8)'`
if [ "$result" = "(247 : nat)" ]; then
    echo "\033[32muint8 sub success. 255 - 8 = 247. \033[0m"
else
    echo 
    echo "\033[31muint8 sub fail. 255 - 8 = $result, expected '(247 : nat)' \033[0m"
    echo 
fi

# test uint8 mul
result=`dfx canister call Test testSafeUint8Mul '(123, 255)'`
if [ "$result" = "(133 : nat)" ]; then
    echo "\033[32muint8 mul success. 123 * 255 = 2. \033[0m"
else
    echo 
    echo "\033[31muint8 mul fail. 123 * 255 = $result, expected '(133 : nat)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeUint8Mul '(255, 8)'`
if [ "$result" = "(248 : nat)" ]; then
    echo "\033[32muint8 mul success. 255 * 8 = 248. \033[0m"
else
    echo 
    echo "\033[31muint8 mul fail. 255 * 8 = $result, expected '(248 : nat)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeUint8Mul '(255, 0)'`
if [ "$result" = "(0 : nat)" ]; then
    echo "\033[32muint8 mul success. 255 * 0 = 0. \033[0m"
else
    echo 
    echo "\033[31muint8 mul fail. 255 * 0 = $result, expected '(0 : nat)' \033[0m"
    echo 
fi
# test uint8 div
result=`dfx canister call Test testSafeUint8Div '(123, 255)'`
if [ "$result" = "(0 : nat)" ]; then
    echo "\033[32muint8 div success. 123 / 255 = 0. \033[0m"
else
    echo 
    echo "\033[31muint8 div fail. 123 / 255 = $result, expected '(0 : nat)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeUint8Div '(255, 8)'`
if [ "$result" = "(31 : nat)" ]; then
    echo "\033[32muint8 div success. 255 / 8 = 31. \033[0m"
else
    echo 
    echo "\033[31muint8 div fail. 255 / 8 = $result, expected '(31 : nat)' \033[0m"
    echo 
fi
# test uint8 rem
result=`dfx canister call Test testSafeUint8Rem '(255, 8)'`
if [ "$result" = "(7 : nat)" ]; then
    echo "\033[32muint8 rem success. 255 % 8 = 7. \033[0m"
else
    echo 
    echo "\033[31muint8 rem fail. 255 % 8 = $result, expected '(7 : nat)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeUint8Rem '(123, 255)'`
if [ "$result" = "(123 : nat)" ]; then
    echo "\033[32muint8 rem success. 123 % 255 = 123. \033[0m"
else
    echo 
    echo "\033[31muint8 rem fail. 123 % 255 = $result, expected '(123 : nat)' \033[0m"
    echo 
fi

# test uint8 left
result=`dfx canister call Test testSafeUint8And '(123, 255)'`
if [ "$result" = "(123 : nat)" ]; then
    echo "\033[32muint8 and success. 123 & 255 = 123. \033[0m"
else
    echo 
    echo "\033[31muint8 and fail. 123 & 255 = $result, expected '(123 : nat)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeUint8And '(111, 100)'`
if [ "$result" = "(100 : nat)" ]; then
    echo "\033[32muint8 and success. 111 % 100 = 100. \033[0m"
else
    echo 
    echo "\033[31muint8 and fail. 111 % 100 = $result, expected '(100 : nat)' \033[0m"
    echo 
fi


echo
echo "test uint16 ..."
echo

echo
echo "test uint256 ..."
echo
result=`dfx canister call Test testSafeUint256Mul '(7608696396275, 104128431978213721348833895885)'`
if [ "$result" = "(792_281_625_142_401_210_938_629_495_793_768_051_828_375 : nat)" ]; then
    echo "\033[32muint256 mul success. 7608696396275 * 104128431978213721348833895885 = 792_281_625_142_401_210_938_629_495_793_768_051_828_375. \033[0m"
else
    echo 
    echo "\033[31muint256 mul fail. 7608696396275 * 104128431978213721348833895885 = $result, expected '(792_281_625_142_401_210_938_629_495_793_768_051_828_375 : nat)' \033[0m"
    echo 
fi
echo $result

echo 
echo "complete test"
echo
