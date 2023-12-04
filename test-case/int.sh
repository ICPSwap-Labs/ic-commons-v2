#!/bin/bash

echo
echo "test int8 ..."
echo

# test int8 add
result=`dfx canister call Test testSafeInt8Add '(123, -128)'`
if [ "$result" = "(-5 : int)" ]; then
    echo "\033[32mint8 add success. 123 + -128 = 122. \033[0m"
else
    echo 
    echo "\033[31mint8 add fail. 123 + -128 = $result, expected '(-5 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Add '(123, -120)'`
if [ "$result" = "(3 : int)" ]; then
    echo "\033[32mint8 add success. 123 + -120 = 3. \033[0m"
else
    echo 
    echo "\033[31mint8 add fail. 123 + -120 = $result, expected '(3 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Add '(123, 8)'`
if [ "$result" = "(-125 : int)" ]; then
    echo "\033[32mint8 add success. 123 + 8 = -125. \033[0m"
else
    echo 
    echo "\033[31mint8 add fail. 123 + 8 = $result, expected '(-125 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Add '(-123, -128)'`
if [ "$result" = "(5 : int)" ]; then
    echo "\033[32mint8 add success. -123 + -128 = 5. \033[0m"
else
    echo 
    echo "\033[31mint8 add fail. -123 + -128 = $result, expected '(5 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Add '(-123, 127)'`
if [ "$result" = "(4 : int)" ]; then
    echo "\033[32mint8 add success. -123 + 127 = 4. \033[0m"
else
    echo 
    echo "\033[31mint8 add fail. -123 + 127 = $result, expected '(4 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Add '(-123, 120)'`
if [ "$result" = "(-3 : int)" ]; then
    echo "\033[32mint8 add success. -123 + 120 = -3. \033[0m"
else
    echo 
    echo "\033[31mint8 add fail. -123 + 120 = $result, expected '(-3 : int)' \033[0m"
    echo 
fi

# test int8 sub
result=`dfx canister call Test testSafeInt8Sub '(123, 120)'`
if [ "$result" = "(3 : int)" ]; then
    echo "\033[32mint8 sub success. 123 - 120 = 3. \033[0m"
else
    echo 
    echo "\033[31mint8 sub fail. 123 - 120 = $result, expected '(3 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Sub '(123, 127)'`
if [ "$result" = "(-4 : int)" ]; then
    echo "\033[32mint8 sub success. 123 - 127 = -4. \033[0m"
else
    echo 
    echo "\033[31mint8 sub fail. 123 - 127 = $result, expected '(-4 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Sub '(123, -128)'`
if [ "$result" = "(-5 : int)" ]; then
    echo "\033[32mint8 sub success. 123 - -128 = -5. \033[0m"
else
    echo 
    echo "\033[31mint8 sub fail. 123 - -128 = $result, expected '(-5 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Sub '(123, -120)'`
if [ "$result" = "(-13 : int)" ]; then
    echo "\033[32mint8 sub success. 123 - -120 = -13. \033[0m"
else
    echo 
    echo "\033[31mint8 sub fail. 123 - -120 = $result, expected '(-13 : int)' \033[0m"
    echo 
fi

# test int8 mul
result=`dfx canister call Test testSafeInt8Mul '(123, -128)'`
if [ "$result" = "(-128 : int)" ]; then
    echo "\033[32mint8 mul success. 123 * -128 = -128. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. 123 * -128 = $result, expected '(-128 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Mul '(123, -12)'`
if [ "$result" = "(60 : int)" ]; then
    echo "\033[32mint8 mul success. 123 * -12 = 60. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. 123 * -12 = $result, expected '(60 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Mul '(123, 127)'`
if [ "$result" = "(5 : int)" ]; then
    echo "\033[32mint8 mul success. 123 * 127 = 5. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. 123 * 127 = $result, expected '(5 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Mul '(123, 8)'`
if [ "$result" = "(-40 : int)" ]; then
    echo "\033[32mint8 mul success. 123 * 8 = -40. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. 123 * 8 = $result, expected '(-40 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Mul '(127, 0)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 mul success. 127 * 0 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. 127 * 0 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Mul '(-123, -128)'`
if [ "$result" = "(-128 : int)" ]; then
    echo "\033[32mint8 mul success. -123 * -128 = -128. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. -123 * -128 = $result, expected '(-128 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Mul '(-123, -12)'`
if [ "$result" = "(-60 : int)" ]; then
    echo "\033[32mint8 mul success. -123 * -12 = -60. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. -123 * -12 = $result, expected '(-60 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Mul '(-123, 127)'`
if [ "$result" = "(-5 : int)" ]; then
    echo "\033[32mint8 mul success. -123 * 127 = -5. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. -123 * 127 = $result, expected '(-5 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Mul '(-123, 8)'`
if [ "$result" = "(40 : int)" ]; then
    echo "\033[32mint8 mul success. -123 * 8 = 40. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. -123 * 8 = $result, expected '(40 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Mul '(-127, 0)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 mul success. -127 * 0 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 mul fail. -127 * 0 = $result, expected '(0 : int)' \033[0m"
    echo 
fi

# test int8 div
result=`dfx canister call Test testSafeInt8Div '(123, -128)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 div success. 123 / -128 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 div fail. 123 / -128 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Div '(123, 127)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 div success. 123 / 127 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 div fail. 123 / 127 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Div '(123, 8)'`
if [ "$result" = "(15 : int)" ]; then
    echo "\033[32mint8 div success. 123 / 8 = 15. \033[0m"
else
    echo 
    echo "\033[31mint8 div fail. 123 / 8 = $result, expected '(15 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Div '(123, -8)'`
if [ "$result" = "(-15 : int)" ]; then
    echo "\033[32mint8 div success. 123 / -8 = -15. \033[0m"
else
    echo 
    echo "\033[31mint8 div fail. 123 / -8 = $result, expected '(-15 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Div '(-123, -128)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 div success. -123 / -128 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 div fail. -123 / -128 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Div '(-123, 127)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 div success. -123 / 127 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 div fail. -123 / 127 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Div '(-123, 8)'`
if [ "$result" = "(-15 : int)" ]; then
    echo "\033[32mint8 div success. -123 / 8 = -15. \033[0m"
else
    echo 
    echo "\033[31mint8 div fail. -123 / 8 = $result, expected '(-15 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Div '(-123, -8)'`
if [ "$result" = "(15 : int)" ]; then
    echo "\033[32mint8 div success. -123 / -8 = 15. \033[0m"
else
    echo 
    echo "\033[31mint8 div fail. -123 / -8 = $result, expected '(15 : int)' \033[0m"
    echo 
fi

# test int8 rem
result=`dfx canister call Test testSafeInt8Rem '(123, 127)'`
if [ "$result" = "(123 : int)" ]; then
    echo "\033[32mint8 rem success. 123 % 127 = 123. \033[0m"
else
    echo 
    echo "\033[31mint8 rem fail. 123 % 127 = $result, expected '(123 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Rem '(123, 8)'`
if [ "$result" = "(3 : int)" ]; then
    echo "\033[32mint8 rem success. 123 % 8 = 3. \033[0m"
else
    echo 
    echo "\033[31mint8 rem fail. 123 % 8 = $result, expected '(3 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Rem '(123, -128)'`
if [ "$result" = "(123 : int)" ]; then
    echo "\033[32mint8 rem success. 123 % -128 = 123. \033[0m"
else
    echo 
    echo "\033[31mint8 rem fail. 123 % -128 = $result, expected '(123 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Rem '(123, -8)'`
if [ "$result" = "(3 : int)" ]; then
    echo "\033[32mint8 rem success. 123 % -8 = 3. \033[0m"
else
    echo 
    echo "\033[31mint8 rem fail. 123 % -8 = $result, expected '(3 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Rem '(-123, 127)'`
if [ "$result" = "(-123 : int)" ]; then
    echo "\033[32mint8 rem success. -123 % 127 = -123. \033[0m"
else
    echo 
    echo "\033[31mint8 rem fail. -123 % 127 = $result, expected '(-123 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Rem '(-123, 8)'`
if [ "$result" = "(-3 : int)" ]; then
    echo "\033[32mint8 rem success. -123 % 8 = -3. \033[0m"
else
    echo 
    echo "\033[31mint8 rem fail. -123 % 8 = $result, expected '(-3 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Rem '(-123, -127)'`
if [ "$result" = "(-123 : int)" ]; then
    echo "\033[32mint8 rem success. -123 % -127 = -123. \033[0m"
else
    echo 
    echo "\033[31mint8 rem fail. -123 % -127 = $result, expected '(-123 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Rem '(-123, -8)'`
if [ "$result" = "(-3 : int)" ]; then
    echo "\033[32mint8 rem success. -123 % -8 = -3. \033[0m"
else
    echo 
    echo "\033[31mint8 rem fail. -123 % -8 = $result, expected '(-3 : int)' \033[0m"
    echo 
fi

# test int8 left
result=`dfx canister call Test testSafeInt8Left '(123, 128)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 left success. 123 << 128 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 left fail. 123 << -128 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Left '(123, 2)'`
if [ "$result" = "(-20 : int)" ]; then
    echo "\033[32mint8 left success. 123 << 2 = -20. \033[0m"
else
    echo 
    echo "\033[31mint8 left fail. 123 << 2 = $result, expected '(-20 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Left '(-123, 128)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 left success. -123 << 128 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 left fail. -123 << -128 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Left '(-123, 2)'`
if [ "$result" = "(20 : int)" ]; then
    echo "\033[32mint8 left success. -123 << 2 = 20. \033[0m"
else
    echo 
    echo "\033[31mint8 left fail. -123 << 2 = $result, expected '(20 : int)' \033[0m"
    echo 
fi

# test int8 right
result=`dfx canister call Test testSafeInt8Right '(123, 127)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 right success. 123 >> 127 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 right fail. 123 >> 127 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Right '(123, 2)'`
if [ "$result" = "(30 : int)" ]; then
    echo "\033[32mint8 right success. 123 >> 2 = 30. \033[0m"
else
    echo 
    echo "\033[31mint8 right fail. 123 >> 2 = $result, expected '(30 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Right '(-123, 127)'`
if [ "$result" = "(-1 : int)" ]; then
    echo "\033[32mint8 right success. -123 >> 127 = -1. \033[0m"
else
    echo 
    echo "\033[31mint8 right fail. -123 >> 127 = $result, expected '(-1 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Right '(-123, 2)'`
if [ "$result" = "(-31 : int)" ]; then
    echo "\033[32mint8 right success. -123 >> 2 = -31. \033[0m"
else
    echo 
    echo "\033[31mint8 right fail. -123 >> 2 = $result, expected '(-31 : int)' \033[0m"
    echo 
fi

# test int8 and
result=`dfx canister call Test testSafeInt8And '(123, -128)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 and success. 123 & -128 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 and fail. 123 & -128 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8And '(123, 127)'`
if [ "$result" = "(123 : int)" ]; then
    echo "\033[32mint8 and success. 123 & 127 = 123. \033[0m"
else
    echo 
    echo "\033[31mint8 and fail. 123 & 127 = $result, expected '(123 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8And '(123, 10)'`
if [ "$result" = "(10 : int)" ]; then
    echo "\033[32mint8 and success. 123 & 10 = 10. \033[0m"
else
    echo 
    echo "\033[31mint8 and fail. 123 & 10 = $result, expected '(10 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8And '(123, -10)'`
if [ "$result" = "(114 : int)" ]; then
    echo "\033[32mint8 and success. 123 & -10 = 114. \033[0m"
else
    echo 
    echo "\033[31mint8 and fail. 123 & -10 = $result, expected '(114 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8And '(-123, -128)'`
if [ "$result" = "(-128 : int)" ]; then
    echo "\033[32mint8 and success. -123 & -128 = -128. \033[0m"
else
    echo 
    echo "\033[31mint8 and fail. -123 & -128 = $result, expected '(-128 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8And '(-123, 127)'`
if [ "$result" = "(5 : int)" ]; then
    echo "\033[32mint8 and success. -123 & 127 = 5. \033[0m"
else
    echo 
    echo "\033[31mint8 and fail. -123 & 127 = $result, expected '(5 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8And '(-123, 10)'`
if [ "$result" = "(0 : int)" ]; then
    echo "\033[32mint8 and success. -123 & 10 = 0. \033[0m"
else
    echo 
    echo "\033[31mint8 and fail. -123 & 10 = $result, expected '(0 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8And '(-123, -10)'`
if [ "$result" = "(-124 : int)" ]; then
    echo "\033[32mint8 and success. -123 & -10 = -124. \033[0m"
else
    echo 
    echo "\033[31mint8 and fail. -123 & -10 = $result, expected '(-124 : int)' \033[0m"
    echo 
fi

# test int8 or
result=`dfx canister call Test testSafeInt8Or '(123, -128)'`
if [ "$result" = "(-5 : int)" ]; then
    echo "\033[32mint8 or success. 123 | -128 = -5. \033[0m"
else
    echo 
    echo "\033[31mint8 or fail. 123 | -128 = $result, expected '(-5 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Or '(123, 127)'`
if [ "$result" = "(127 : int)" ]; then
    echo "\033[32mint8 or success. 123 | 127 = 127. \033[0m"
else
    echo 
    echo "\033[31mint8 or fail. 123 | 127 = $result, expected '(127 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Or '(123, -10)'`
if [ "$result" = "(-1 : int)" ]; then
    echo "\033[32mint8 or success. 123 | -10 = -1. \033[0m"
else
    echo 
    echo "\033[31mint8 or fail. 123 | -10 = $result, expected '(-1 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Or '(123, 10)'`
if [ "$result" = "(123 : int)" ]; then
    echo "\033[32mint8 or success. 123 | 10 = 123. \033[0m"
else
    echo 
    echo "\033[31mint8 or fail. 123 | 10 = $result, expected '(123 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Or '(-123, -128)'`
if [ "$result" = "(-123 : int)" ]; then
    echo "\033[32mint8 or success. -123 | -128 = -123. \033[0m"
else
    echo 
    echo "\033[31mint8 or fail. -123 | -128 = $result, expected '(-123 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Or '(-123, 127)'`
if [ "$result" = "(-1 : int)" ]; then
    echo "\033[32mint8 or success. -123 | 127 = -1. \033[0m"
else
    echo 
    echo "\033[31mint8 or fail. -123 | 127 = $result, expected '(-1 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Or '(-123, -10)'`
if [ "$result" = "(-9 : int)" ]; then
    echo "\033[32mint8 or success. -123 | -10 = -9. \033[0m"
else
    echo 
    echo "\033[31mint8 or fail. -123 | -10 = $result, expected '(-9 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Or '(-123, 10)'`
if [ "$result" = "(-113 : int)" ]; then
    echo "\033[32mint8 or success. -123 | 10 = -113. \033[0m"
else
    echo 
    echo "\033[31mint8 or fail. -123 | 10 = $result, expected '(-113 : int)' \033[0m"
    echo 
fi

# test int8 xor
result=`dfx canister call Test testSafeInt8Xor '(123, -128)'`
if [ "$result" = "(-5 : int)" ]; then
    echo "\033[32mint8 xor success. 123 ^ -128 = -5. \033[0m"
else
    echo 
    echo "\033[31mint8 xor fail. 123 ^ -128 = $result, expected '(-5 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Xor '(123, 127)'`
if [ "$result" = "(4 : int)" ]; then
    echo "\033[32mint8 xor success. 123 ^ 127 = 4. \033[0m"
else
    echo 
    echo "\033[31mint8 xor fail. 123 ^ 127 = $result, expected '(4 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Xor '(123, -10)'`
if [ "$result" = "(-115 : int)" ]; then
    echo "\033[32mint8 xor success. 123 ^ -10 = -115. \033[0m"
else
    echo 
    echo "\033[31mint8 xor fail. 123 ^ -10 = $result, expected '(-115 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Xor '(123, 10)'`
if [ "$result" = "(113 : int)" ]; then
    echo "\033[32mint8 xor success. 123 ^ 10 = 113. \033[0m"
else
    echo 
    echo "\033[31mint8 xor fail. 123 ^ 10 = $result, expected '(113 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Xor '(-123, -128)'`
if [ "$result" = "(5 : int)" ]; then
    echo "\033[32mint8 xor success. -123 ^ -128 = 5. \033[0m"
else
    echo 
    echo "\033[31mint8 xor fail. -123 ^ -128 = $result, expected '(5 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Xor '(-123, 127)'`
if [ "$result" = "(-6 : int)" ]; then
    echo "\033[32mint8 xor success. -123 ^ 127 = -6. \033[0m"
else
    echo 
    echo "\033[31mint8 xor fail. -123 ^ 127 = $result, expected '(-6 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Xor '(-123, -10)'`
if [ "$result" = "(115 : int)" ]; then
    echo "\033[32mint8 xor success. -123 ^ -10 = 115. \033[0m"
else
    echo 
    echo "\033[31mint8 xor fail. -123 ^ -10 = $result, expected '(115 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Xor '(-123, 10)'`
if [ "$result" = "(-113 : int)" ]; then
    echo "\033[32mint8 xor success. -123 ^ 10 = -113. \033[0m"
else
    echo 
    echo "\033[31mint8 xor fail. -123 ^ 10 = $result, expected '(-113 : int)' \033[0m"
    echo 
fi

# test int8 not
result=`dfx canister call Test testSafeInt8Not '(10, 0)'`
if [ "$result" = "(-11 : int)" ]; then
    echo "\033[32mint8 not success. ~ 10 = -11. \033[0m"
else
    echo 
    echo "\033[31mint8 not fail. ~ 10 = $result, expected '(-11 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Not '(-10, 0)'`
if [ "$result" = "(9 : int)" ]; then
    echo "\033[32mint8 not success. ~ -10 = 9. \033[0m"
else
    echo 
    echo "\033[31mint8 not fail. ~ -10 = $result, expected '(9 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Not '(127, -0)'`
if [ "$result" = "(-128 : int)" ]; then
    echo "\033[32mint8 not success. ~ 127 = -128. \033[0m"
else
    echo 
    echo "\033[31mint8 not fail. ~ 127 = $result, expected '(-128 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Not '(-128, 0)'`
if [ "$result" = "(127 : int)" ]; then
    echo "\033[32mint8 not success. ~ -128 = 127. \033[0m"
else
    echo 
    echo "\033[31mint8 not fail. ~ -128 = $result, expected '(127 : int)' \033[0m"
    echo 
fi

# test int8 neg
result=`dfx canister call Test testSafeInt8Neg '(123)'`
if [ "$result" = "(-123 : int)" ]; then
    echo "\033[32mint8 neg success. neg(123) = -123. \033[0m"
else
    echo 
    echo "\033[31mint8 neg fail. neg(123) = $result, expected '(-123 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Neg '(-127)'`
if [ "$result" = "(127 : int)" ]; then
    echo "\033[32mint8 neg success. neg(-127) = 127. \033[0m"
else
    echo 
    echo "\033[31mint8 neg fail. neg(-127) = $result, expected '(127 : int)' \033[0m"
    echo 
fi
result=`dfx canister call Test testSafeInt8Neg '(-128)'`
if [ "$result" = "(-128 : int)" ]; then
    echo "\033[32mint8 neg success. neg(-128) = -128. \033[0m"
else
    echo 
    echo "\033[31mint8 neg fail. neg(-128) = $result, expected '(-128 : int)' \033[0m"
    echo 
fi


echo
echo "test int24 ..."
echo
result=`dfx canister call Test testSafeInt24Div '(-887272, 123)'`
if [ "$result" = "(-7_213 : int)" ]; then
    echo "\033[32muint24 div success. -887272 / 123 = -7213. \033[0m"
else
    echo 
    echo "\033[31muint24 div fail. -887272 / 123 = $result, expected '(-7_213 : int)' \033[0m"
    echo 
fi

echo
echo "test int256 ..."
echo


echo 
echo "complete test"
echo
