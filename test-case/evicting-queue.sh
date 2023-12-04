#!/bin/bash

echo
echo "test evicting queue ..."
echo

result1=`dfx canister call Test testEvicingQueueAdd '("a")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(1 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"a\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"a\") fail. result = $result1 $result $result2, expected (true) (vec { \"a\" }) (1 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("b")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(2 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"b\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd ("b")' fail. result = $result1 $result $result2, expected (true) (vec { \"a\"; \"b\" }) (2 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("c")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\"; \"c\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"c\") success. $result1 $result \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"c\") fail. result =$result1  $result $result2, expected (true) (vec { \"a\"; \"b\"; \"c\" }) (3 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueRemove`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(2 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove  success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result = $result1 $result $result2, expected () (vec { \"a\"; \"b\" }) (2 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("d")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\"; \"d\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"d\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"d\") fail. result =$result1 $result $result2, expected (true) (vec { \"a\"; \"b\"; \"d\" }) (3 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("e")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\"; \"d\"; \"e\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"e\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"e\") fail. result =$result1 $result $result2, expected (true) (vec { \"a\"; \"b\"; \"d\"; \"e\" }) (4 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testEvicingQueuePeek`
result1=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(opt \"e\")" ] && [ "$result1" = "(vec { \"a\"; \"b\"; \"d\"; \"e\" })" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueuePeek success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueuePeek fail. result = $result $result1 $result2, expected  (opt \"e\") (vec { \"a\"; \"b\"; \"d\"; \"e\" }) (4 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testEvicingQueuePoll`
result1=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(opt \"e\")" ] && [ "$result1" = "(vec { \"a\"; \"b\"; \"d\" })" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueuePoll success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueuePoll fail. result = $result $result1 $result2, expected  (opt \"e\") (vec { \"a\"; \"b\"; \"d\" }) (3 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("f")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\"; \"d\"; \"f\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"f\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"f\") fail. result =$result1 $result $result2, expected (true) (vec { \"a\"; \"b\"; \"d\"; \"f\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueContains '("a")'`
result=`dfx canister call Test testEvicingQueueContains '("b")'`
result2=`dfx canister call Test testEvicingQueueContains '("e")'`
if [ "$result" = "(true)" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(false)" ]; then
    echo "\033[32mqueue testEvicingQueueContains (\"a\") (\"b\") (\"e\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueContains (\"a\") (\"b\") (\"e\") fail. result =$result1  $result $result2, expected (true) (true) (false) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("g")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\"; \"d\"; \"f\"; \"g\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"g\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"g\") fail. result =$result1 $result $result2, expected (true) (vec { \"a\"; \"b\"; \"d\"; \"f\"; \"g\" }) (5 : nat) \033[0m"
    echo 
fi

#--
result1=`dfx canister call Test testEvicingQueueRemove`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\"; \"d\"; \"f\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove  success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result = $result1 $result $result2, expected () (vec { \"a\"; \"b\"; \"d\"; \"f\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("h")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\"; \"d\"; \"f\"; \"h\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"h\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"h\") fail. result =$result1  $result $result2, expected (true) (vec { \"a\"; \"b\"; \"d\"; \"f\"; \"h\" }) (5 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testEvicingQueuePeek`
result1=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(opt \"h\")" ] && [ "$result1" = "(vec { \"a\"; \"b\"; \"d\"; \"f\"; \"h\" })" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueuePeek success. $result $result1 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueuePeek fail. result = $result $result1, expected  (opt \"h\") (vec { \"a\"; \"b\"; \"d\"; \"f\"; \"h\" }) (5 : nat) \033[0m"
    echo 
fi

result=`dfx canister call Test testEvicingQueuePoll`
result1=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(opt \"h\")" ] && [ "$result1" = "(vec { \"a\"; \"b\"; \"d\"; \"f\" })" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueuePeek success. $result $result1 $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueuePeek fail. result = $result $result1 $result2, expected  (opt \"h\") (vec { \"a\"; \"b\"; \"d\"; \"f\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("i")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"a\"; \"b\"; \"d\"; \"f\"; \"i\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"i\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"i\") fail. result =$result1  $result $result2, expected (true) (vec { \"a\"; \"b\"; \"d\"; \"f\"; \"i\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("j")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"b\"; \"d\"; \"f\"; \"i\"; \"j\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"j\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"j\") fail. result =$result1  $result $result2, expected (true) (vec { \"b\"; \"d\"; \"f\"; \"i\"; \"j\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("k")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"d\"; \"f\"; \"i\"; \"j\"; \"k\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"k\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"k\") fail. result =$result1  $result $result2, expected (true) (vec { \"d\"; \"f\"; \"i\"; \"j\"; \"k\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("l")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"f\"; \"i\"; \"j\"; \"k\"; \"l\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"l\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"l\") fail. result =$result1  $result $result2, expected (true) (vec { \"f\"; \"i\"; \"j\"; \"k\"; \"l\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueRemove`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"f\"; \"i\"; \"j\"; \"k\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected () (vec { \"f\"; \"i\"; \"j\"; \"k\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePeek`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"f\"; \"i\"; \"j\"; \"k\" })" ] && [ "$result1" = "(opt \"k\")" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"k\") (vec { \"f\"; \"i\"; \"j\"; \"k\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"f\"; \"i\"; \"j\" })" ] && [ "$result1" = "(opt \"k\")" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"k\") (vec { \"f\"; \"i\"; \"j\" }) (3 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("m")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"f\"; \"i\"; \"j\"; \"m\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"m\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"m\") fail. result =$result1  $result $result2, expected (true) (vec { \"f\"; \"i\"; \"j\"; \"m\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("n")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"f\"; \"i\"; \"j\"; \"m\"; \"n\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"n\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"n\") fail. result =$result1  $result $result2, expected (true) (vec { \"f\"; \"i\"; \"j\"; \"m\"; \"n\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("o")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"i\"; \"j\"; \"m\"; \"n\"; \"o\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"o\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"o\") fail. result =$result1  $result $result2, expected (true) (vec { \"i\"; \"j\"; \"m\"; \"n\"; \"o\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("p")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"j\"; \"m\"; \"n\"; \"o\"; \"p\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"p\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"p\") fail. result =$result1  $result $result2, expected (true) (vec { \"j\"; \"m\"; \"n\"; \"o\"; \"p\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("q")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"m\"; \"n\"; \"o\"; \"p\"; \"q\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"q\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"q\") fail. result =$result1  $result $result2, expected (true) (vec { \"m\"; \"n\"; \"o\"; \"p\"; \"q\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("r")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"n\"; \"o\"; \"p\"; \"q\"; \"r\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"r\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"r\") fail. result =$result1  $result $result2, expected (true) (vec { \"n\"; \"o\"; \"p\"; \"q\"; \"r\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("s")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"o\"; \"p\"; \"q\"; \"r\"; \"s\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"s\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"s\") fail. result =$result1  $result $result2, expected (true) (vec { \"o\"; \"p\"; \"q\"; \"r\"; \"s\" }) (5 : nat) \033[0m"
    echo 
fi
result1=`dfx canister call Test testEvicingQueueAdd '("t")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"p\"; \"q\"; \"r\"; \"s\"; \"t\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"t\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"t\") fail. result =$result1  $result $result2, expected (true) (vec { \"p\"; \"q\"; \"r\"; \"s\"; \"t\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueRemove`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"p\"; \"q\"; \"r\"; \"s\" })" ] && [ "$result1" = "()" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected () (vec { \"p\"; \"q\"; \"r\"; \"s\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePeek`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"p\"; \"q\"; \"r\"; \"s\" })" ] && [ "$result1" = "(opt \"s\")" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"s\") (vec { \"p\"; \"q\"; \"r\"; \"s\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"p\"; \"q\"; \"r\" })" ] && [ "$result1" = "(opt \"s\")" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"k\") (vec { \"p\"; \"q\"; \"r\" }) (3 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"p\"; \"q\" })" ] && [ "$result1" = "(opt \"r\")" ] && [ "$result2" = "(2 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"k\") (vec { \"p\"; \"q\" }) (2 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"p\" })" ] && [ "$result1" = "(opt \"q\")" ] && [ "$result2" = "(1 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"k\") (vec { \"p\" }) (1 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("u")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"p\"; \"u\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(2 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"u\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"u\") fail. result =$result1  $result $result2, expected (true) (vec { \"p\"; \"u\" }) (2 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"p\" })" ] && [ "$result1" = "(opt \"u\")" ] && [ "$result2" = "(1 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"u\") (vec { \"p\" }) (1 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec {})" ] && [ "$result1" = "(opt \"p\")" ] && [ "$result2" = "(0 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"p\") (vec {}) (0 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec {})" ] && [ "$result1" = "(null)" ] && [ "$result2" = "(0 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (null) (vec {}) (0 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec {})" ] && [ "$result1" = "(null)" ] && [ "$result2" = "(0 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (null) (vec {}) (0 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec {})" ] && [ "$result1" = "(null)" ] && [ "$result2" = "(0 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (null) (vec {}) (0 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("v")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"v\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(1 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"v\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"v\") fail. result =$result1  $result $result2, expected (true) (vec { \"v\" }) (1 : nat) \033[0m"
    echo 
fi


result1=`dfx canister call Test testEvicingQueueAdd '("w")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"v\"; \"w\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(2 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"w\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"w\") fail. result =$result1  $result $result2, expected (true) (vec { \"v\"; \"w\" }) (2 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueContains '("v")'`
result=`dfx canister call Test testEvicingQueueContains '("w")'`
result2=`dfx canister call Test testEvicingQueueContains '("1")'`
if [ "$result" = "(true)" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(false)" ]; then
    echo "\033[32mqueue testEvicingQueueContains (\"2\") (\"5\") (\"1\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueContains (\"2\") (\"5\") (\"1\") fail. result =$result1  $result $result2, expected (true) (true) (false) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("x")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"v\"; \"w\"; \"x\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"x\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"x\") fail. result =$result1  $result $result2, expected (true) (vec { \"v\"; \"w\"; \"x\" }) (3 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueContains '("v")'`
result=`dfx canister call Test testEvicingQueueContains '("x")'`
result2=`dfx canister call Test testEvicingQueueContains '("u")'`
if [ "$result" = "(true)" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(false)" ]; then
    echo "\033[32mqueue testEvicingQueueContains (\"v\") (\"w\") (\"u\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueContains (\"v\") (\"w\") (\"u\") fail. result =$result1  $result $result2, expected (true) (true) (false) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("y")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"v\"; \"w\"; \"x\"; \"y\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"y\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"y\") fail. result =$result1  $result $result2, expected (true) (vec { \"v\"; \"w\"; \"x\"; \"y\" }) (4 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("z")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"v\"; \"w\"; \"x\"; \"y\"; \"z\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"z\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"z\") fail. result =$result1  $result $result2, expected (true) (vec { \"v\"; \"w\"; \"x\"; \"y\"; \"z\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("1")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"w\"; \"x\"; \"y\"; \"z\"; \"1\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"1\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"1\") fail. result =$result1  $result $result2, expected (true) (vec { \"w\"; \"x\"; \"y\"; \"z\"; \"1\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("2")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"x\"; \"y\"; \"z\"; \"1\"; \"2\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"2\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"2\") fail. result =$result1  $result $result2, expected (true) (vec { \"x\"; \"y\"; \"z\"; \"1\"; \"2\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("3")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"y\"; \"z\"; \"1\"; \"2\"; \"3\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"3\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"3\") fail. result =$result1  $result $result2, expected (true) (vec { \"y\"; \"z\"; \"1\"; \"2\"; \"3\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("4")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"z\"; \"1\"; \"2\"; \"3\"; \"4\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"4\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"4\") fail. result =$result1  $result $result2, expected (true) (vec { \"z\"; \"1\"; \"2\"; \"3\"; \"4\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("5")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"1\"; \"2\"; \"3\"; \"4\"; \"5\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"5 \") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"5\") fail. result =$result1  $result $result2, expected (true) (vec { \"1\"; \"2\"; \"3\"; \"4\"; \"5\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("6")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"2\"; \"3\"; \"4\"; \"5\"; \"6\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(5 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"6 \") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"6\") fail. result =$result1  $result $result2, expected (true) (vec { \"2\"; \"3\"; \"4\"; \"5\"; \"6\" }) (5 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"2\"; \"3\"; \"4\"; \"5\" })" ] && [ "$result1" = "(opt \"6\")" ] && [ "$result2" = "(4 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"k\") (vec { \"2\"; \"3\"; \"4\"; \"5\" }) (4 : nat) \033[0m"
    echo 
fi


result1=`dfx canister call Test testEvicingQueueContains '("2")'`
result=`dfx canister call Test testEvicingQueueContains '("5")'`
result2=`dfx canister call Test testEvicingQueueContains '("1")'`
if [ "$result" = "(true)" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(false)" ]; then
    echo "\033[32mqueue testEvicingQueueContains (\"2\") (\"5\") (\"1\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueContains (\"2\") (\"5\") (\"1\") fail. result =$result1  $result $result2, expected (true) (true) (false) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"2\"; \"3\"; \"4\" })" ] && [ "$result1" = "(opt \"5\")" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"k\") (vec { \"2\"; \"3\"; \"4\" }) (3 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueuePoll`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"2\"; \"3\" })" ] && [ "$result1" = "(opt \"4\")" ] && [ "$result2" = "(2 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueRemove success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueRemove fail. result =$result1  $result $result2, expected (opt \"k\") (vec { \"2\"; \"3\" }) (2 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueAdd '("7")'`
result=`dfx canister call Test testEvicingQueueArray`
result2=`dfx canister call Test testEvicingQueueSize`
if [ "$result" = "(vec { \"2\"; \"3\"; \"7\" })" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(3 : nat)" ]; then
    echo "\033[32mqueue testEvicingQueueAdd (\"7\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueAdd (\"7\") fail. result =$result1  $result $result2, expected (true) (vec { \"2\"; \"3\"; \"7\" }) (3 : nat) \033[0m"
    echo 
fi

result1=`dfx canister call Test testEvicingQueueContains '("2")'`
result=`dfx canister call Test testEvicingQueueContains '("7")'`
result2=`dfx canister call Test testEvicingQueueContains '("1")'`
if [ "$result" = "(true)" ] && [ "$result1" = "(true)" ] && [ "$result2" = "(false)" ]; then
    echo "\033[32mqueue testEvicingQueueContains (\"2\") (\"7\") (\"1\") success. $result1 $result $result2 \033[0m"
else
    echo 
    echo "\033[31mqueue testEvicingQueueContains (\"2\") (\"7\") (\"1\") fail. result =$result1  $result $result2, expected (true) (true) (false) \033[0m"
    echo 
fi