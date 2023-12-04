#!/bin/bash

echo
echo "test queue ..."
echo

dfx canister call Test testQueueAdd '("e", 4)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"e\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"e\", 4) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd 1 fail. result = $result, expected (vec { \"e\" }) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueSize`
if [ "$result" = "(1 : nat)" ]; then
    echo "\033[32mqueue size is 1. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 1 fail. result = $result, expected (1 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueAdd '("d", 3)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"d\"; \"e\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"d\", 3) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd (\"d\", 3) fail. result = $result, expected (vec { \"d\"; \"e\" }) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueSize`
if [ "$result" = "(2 : nat)" ]; then
    echo "\033[32mqueue size is 2. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 2 fail. result = $result, expected (2 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueAdd '("f", 4)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"d\"; \"e\"; \"f\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"f\", 4) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd (\"f\", 4) fail. result = $result, expected (vec { \"d\"; \"e\"; \"f\" }) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueSize`
if [ "$result" = "(3 : nat)" ]; then
    echo "\033[32mqueue size is 3. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 3 fail. result = $result, expected (3 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueAdd '("d1", 3)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"d\"; \"d1\"; \"e\"; \"f\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"d1\", 3) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd (\"d1\", 3) fail. result = $result, expected (vec { \"d\"; \"d1\"; \"e\"; \"f\" }) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueSize`
if [ "$result" = "(4 : nat)" ]; then
    echo "\033[32mqueue size is 4. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 4 fail. result = $result, expected (4 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueAdd '("b", 2)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"b\"; \"d\"; \"d1\"; \"e\"; \"f\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"b\", 2) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd 5 fail. result = $result, expected (vec { \"b\"; \"d\"; \"d1\"; \"e\"; \"f\" }) \033[0m"
    echo 
fi

result=`dfx canister call Test testQueueSize`
if [ "$result" = "(5 : nat)" ]; then
    echo "\033[32mqueue size is 5. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 5 fail. result = $result, expected (5 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueDelete '(2)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"b\"; \"d\"; \"e\"; \"f\" })" ]; then
    echo "\033[32mqueue testQueueDelete (2) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueDelete (2) fail. result = $result, expected (vec { \"b\"; \"d\"; \"e\"; \"f\" }) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueSize`
if [ "$result" = "(4 : nat)" ]; then
    echo "\033[32mqueue size is 4. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 6 fail. result = $result, expected (4 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueDelete '(0)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"d\"; \"e\"; \"f\" })" ]; then
    echo "\033[32mqueue testQueueDelete (0) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueDelete (0) fail. result = $result, expected (vec { \"d\"; \"e\"; \"f\" }) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueSize`
if [ "$result" = "(3 : nat)" ]; then
    echo "\033[32mqueue size is 3. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 7 fail. result = $result, expected (3 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueDelete '(2)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"d\"; \"e\" })" ]; then
    echo "\033[32mqueue testQueueDelete (2) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueDelete (2) fail. result = $result, expected (vec { \"d\"; \"e\" }) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueSize`
if [ "$result" = "(2 : nat)" ]; then
    echo "\033[32mqueue size is 2. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 7 fail. result = $result, expected (2 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueDelete '(2)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"d\"; \"e\" })" ]; then
    echo "\033[32mqueue testQueueDelete (2) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueDelete (2) fail. result = $result, expected (vec { \"d\"; \"e\" }) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueSize`
if [ "$result" = "(2 : nat)" ]; then
    echo "\033[32mqueue size is 2. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 7 fail. result = $result, expected (2 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueAdd '("g", 5)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"d\"; \"e\"; \"g\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"g\", 5) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd (\"g\", 5) fail. result = $result, expected (vec { \"d\"; \"e\"; \"g\" }) \033[0m"
    echo 
fi

result=`dfx canister call Test testQueueSize`
if [ "$result" = "(3 : nat)" ]; then
    echo "\033[32mqueue size is $result. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize fail. result = $result, expected (3 : nat) \033[0m"
    echo 
fi

dfx canister call Test testQueueAdd '("h", 6)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"d\"; \"e\"; \"g\"; \"h\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"h\", 6) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd (\"h\", 6) fail. result = $result, expected (vec { \"d\"; \"e\"; \"g\"; \"h\" }) \033[0m"
    echo 
fi

result=`dfx canister call Test testQueueSize`
if [ "$result" = "(4 : nat)" ]; then
    echo "\033[32mqueue size is $result. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize fail. result = $result, expected (4 : nat) \033[0m"
    echo 
fi
dfx canister call Test testQueueAdd '("a", 1)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"a\"; \"d\"; \"e\"; \"g\"; \"h\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"a\", 1) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd (\"a\", 1) fail. result = $result, expected (vec { \"a\"; \"d\"; \"e\"; \"g\"; \"h\" }) \033[0m"
    echo 
fi

result=`dfx canister call Test testQueueSize`
if [ "$result" = "(5 : nat)" ]; then
    echo "\033[32mqueue size is $result. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize fail. result = $result, expected (5 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testQueueExpire '(5)'`
if [ "$result" = "(3 : nat)" ]; then
    echo "\033[32mqueue testQueueExpire (5) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueExpire (5) fail. result = $result, expected (3 : nat) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"g\"; \"h\" })" ]; then
    echo "\033[32mqueue testQueueExpire (5) get success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueExpire (5) get fail. result = $result, expected (vec { \"g\"; \"h\" }) \033[0m"
    echo 
fi

result=`dfx canister call Test testQueueSize`
if [ "$result" = "(2 : nat)" ]; then
    echo "\033[32mqueue size is $result. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize fail. result = $result, expected (2 : nat) \033[0m"
    echo 
fi
dfx canister call Test testQueueAdd '("a", 1)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"a\"; \"g\"; \"h\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"a\", 1) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd (\"a\", 1) fail. result = $result, expected (vec { \"a\"; \"g\"; \"h\" }) \033[0m"
    echo 
fi

result=`dfx canister call Test testQueueSize`
if [ "$result" = "(3 : nat)" ]; then
    echo "\033[32mqueue size is $result. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize fail. result = $result, expected (3 : nat) \033[0m"
    echo 
fi
dfx canister call Test testQueueAdd '("b", 2)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"a\"; \"b\"; \"g\"; \"h\" })" ]; then
    echo "\033[32mqueue testQueueAdd (\"b\", 2) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueAdd (\"b\", 2) fail. result = $result, expected (vec { \"a\"; \"b\"; \"g\"; \"h\" }) \033[0m"
    echo 
fi

result=`dfx canister call Test testQueueSize`
if [ "$result" = "(4 : nat)" ]; then
    echo "\033[32mqueue size is $result. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize fail. result = $result, expected (4 : nat) \033[0m"
    echo 
fi
dfx canister call Test testQueueDelete '(1)'
result=`dfx canister call Test testQueueGet`
if [ "$result" = "(vec { \"a\"; \"g\"; \"h\" })" ]; then
    echo "\033[32mqueue testQueueDelete (1) success. $result \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueDelete (1) fail. result = $result, expected (vec { \"a\"; \"g\"; \"h\" }) \033[0m"
    echo 
fi
result=`dfx canister call Test testQueueSize`
if [ "$result" = "(3 : nat)" ]; then
    echo "\033[32mqueue size is 2. \033[0m"
else
    echo 
    echo "\033[31mqueue testQueueSize 3 fail. result = $result, expected (2 : nat) \033[0m"
    echo 
fi