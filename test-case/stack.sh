#!/bin/bash

echo
echo "test evicting queue ..."
echo

result1=`dfx canister call Test testStackAdd '("e")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"e\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(1 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"a\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"e\") fail. result = $result1 $result $result2, expected (true) (vec { \"e\" }) (1 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackAdd '("c")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"c\"; \"e\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(2 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"c\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"c\")' fail. result = $result1 $result $result2, expected (true) (vec { \"c\"; \"e\" }) (2 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackAdd '("d")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"c\"; \"d\"; \"e\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"d\") success. $result1 $result \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"d\") fail. result =$result1  $result $result2, expected (true) (vec { \"c\"; \"d\"; \"e\" }) (3 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackAdd '("d")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"c\"; \"d\"; \"d\"; \"e\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"d\") success. $result1 $result \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"d\") fail. result =$result1  $result $result2, expected (true) (vec { \"c\"; \"d\"; \"d\"; \"e\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackAdd '("a")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"a\"; \"c\"; \"d\"; \"d\"; \"e\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"a\") success. $result1 $result \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"a\") fail. result =$result1  $result $result2, expected (true) (vec { \"a\"; \"c\"; \"d\"; \"d\"; \"e\" }) (5 : nat) \033[0m"
    echo 
fi


result1=`dfx canister call Test testStackRemove`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"c\"; \"d\"; \"d\"; \"e\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testStackRemove  success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackRemove fail. result = $result1 $result $result2, expected () (vec { \"c\"; \"d\"; \"d\"; \"e\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackAdd '("b")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"b\"; \"c\"; \"d\"; \"d\"; \"e\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"b\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"b\") fail. result =$result1 $result $result2, expected (true) (vec { \"b\"; \"c\"; \"d\"; \"d\"; \"e\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackAdd '("f")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"b\"; \"c\"; \"d\"; \"d\"; \"e\"; \"f\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(6 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"f\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"f\") fail. result =$result1 $result $result2, expected (true) (vec { \"b\"; \"c\"; \"d\"; \"d\"; \"e\"; \"f\" }) (6 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testStackPeek`
result1=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(opt \"b\")" ] && [ "$result1" = "(vec { \"b\"; \"c\"; \"d\"; \"d\"; \"e\"; \"f\" })" ] && [ "$result2" = "(6 : nat)" ]; then
    echo "\033[32mqueue testStackPeek success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackPeek fail. result = $result $result1 $result2, expected  (opt \"e\") (vec { \"b\"; \"c\"; \"d\"; \"d\"; \"e\"; \"f\" }) (6 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testStackPoll`
result1=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(opt \"b\")" ] && [ "$result1" = "(vec { \"c\"; \"d\"; \"d\"; \"e\"; \"f\" })" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testStackPoll success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackPoll fail. result = $result $result1 $result2, expected  (opt \"b\") (vec { \"c\"; \"d\"; \"d\"; \"e\"; \"f\" }) (5 : nat) \033[0m"
    echo 
fi


result=`dfx canister call Test testStackPoll`
result1=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(opt \"c\")" ] && [ "$result1" = "(vec { \"d\"; \"d\"; \"e\"; \"f\" })" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testStackPoll success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackPoll fail. result = $result $result1 $result2, expected  (opt \"c\") (vec { \"d\"; \"d\"; \"e\"; \"f\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackContains '("d")'`
result=`dfx canister call Test testStackContains '("f")'`
result2=`dfx canister call Test testStackContains '("a")'`
if [ "$result" = "(true)" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(false)" ]; then
    echo "\033[32mqueue testStackContains (\"a\") (\"b\") (\"e\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackContains (\"a\") (\"b\") (\"e\") fail. result =$result1  $result $result2, expected (true) (true) (false) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackAdd '("g")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"d\"; \"d\"; \"e\"; \"f\"; \"g\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"g\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"g\") fail. result =$result1 $result $result2, expected (true) (vec { \"d\"; \"d\"; \"e\"; \"f\"; \"g\" }) (5 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testStackPoll`
result1=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(opt \"d\")" ] && [ "$result1" = "(vec { \"d\"; \"e\"; \"f\"; \"g\" })" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testStackPoll success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackPoll fail. result = $result $result1 $result2, expected  (opt \"d\") (vec { \"d\"; \"e\"; \"f\"; \"g\" }) (4 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testStackPoll`
result1=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(opt \"d\")" ] && [ "$result1" = "(vec { \"e\"; \"f\"; \"g\" })" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testStackPoll success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackPoll fail. result = $result $result1 $result2, expected  (opt \"d\") (vec { \"e\"; \"f\"; \"g\" }) (3 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testStackPoll`
result1=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(opt \"e\")" ] && [ "$result1" = "(vec { \"f\"; \"g\" })" ] && [ "$result2" = "(2 : nat)" ]; then
    echo "\033[32mqueue testStackPoll success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackPoll fail. result = $result $result1 $result2, expected  (opt \"e\") (vec { \"f\"; \"g\" }) (2 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testStackPoll`
result1=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(opt \"f\")" ] && [ "$result1" = "(vec { \"g\" })" ] && [ "$result2" = "(1 : nat)" ]; then
    echo "\033[32mqueue testStackPoll success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackPoll fail. result = $result $result1 $result2, expected  (opt \"f\") (vec { \"g\" }) (1 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testStackPoll`
result1=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(opt \"g\")" ] && [ "$result1" = "(vec {})" ] && [ "$result2" = "(0 : nat)" ]; then
    echo "\033[32mqueue testStackPoll success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackPoll fail. result = $result $result1 $result2, expected  (opt \"g\") (vec {}) (0 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testStackPoll`
result1=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(null)" ] && [ "$result1" = "(vec {})" ] && [ "$result2" = "(0 : nat)" ]; then
    echo "\033[32mqueue testStackPoll success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackPoll fail. result = $result $result1 $result2, expected  (null) (vec {}) (0 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackAdd '("e")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"e\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(1 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"a\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"e\") fail. result = $result1 $result $result2, expected (true) (vec { \"e\" }) (1 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testStackAdd '("c")'`
result=`dfx canister call Test testStackArray`
result2=`dfx canister call Test testStackSize`
if [ "$result" = "(vec { \"c\"; \"e\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(2 : nat)" ]; then
    echo "\033[32mqueue testStackAdd (\"c\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testStackAdd (\"c\")' fail. result = $result1 $result $result2, expected (true) (vec { \"c\"; \"e\" }) (2 : nat) \033[0m"
    echo 
fi