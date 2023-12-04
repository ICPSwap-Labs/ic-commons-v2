import Int "mo:base/Int";
import Int16 "mo:base/Int16";
import Int32 "mo:base/Int32";
import Nat "mo:base/Nat";
import Nat16 "mo:base/Nat16";
import Nat32 "mo:base/Nat32";

module {
    private let bit_8_divisor_int: Int = 256;
    private let bit_8_divisor_nat: Nat = 256;

    public func toNat(x: Int, bit: Nat32): Nat {
        var _x: Int = x;
        if (_x < 0) {
            _x := 2 ** Int32.toInt(Int32.fromNat32(bit)) + _x;
        };
        var len: Nat32 = bit / 8;
        var result: Nat = 0;
        var ind: Nat = 0;
        while(_x > 0 and len > 0) {
            result := Nat16.toNat(Int16.toNat16(Int16.fromInt(_x % bit_8_divisor_int))) * (bit_8_divisor_nat ** ind) + result;
            _x := _x / bit_8_divisor_int;
            len := len - 1;
            ind := ind + 1;
        };
        return result;
    };
    public func toInt(x: Nat, bit: Nat32): Int {
        var _x: Nat = x;
        var len: Nat32 = bit / 8;
        var result: Int = 0;
        var ind: Nat = 0;
        while(_x > 0 and len > 0) {
            result :=  Int16.toInt(Int16.fromNat16(Nat16.fromNat(_x % bit_8_divisor_nat))) * (bit_8_divisor_int ** ind) + result;
            _x := _x / bit_8_divisor_nat;
            len := len - 1;
            ind := ind + 1;
        };
        let bit_max: Int = 2 ** Int32.toInt(Int32.fromNat32(bit));
        if (result >= (bit_max / 2)) {
            return result - bit_max;
        } else {
            return result;
        };
    };
    public func truncate(x: Int, max: Int, min: Int): Int {
        var _x: Int = x;
        var b: Int = max - min + 1;
        func h(a: Int): Int {
            if (a > max) {
                h(a - b);
            } else if (a < min) {
                h(b + a);
            } else {
                return a;
            }
        };
        return h(_x);
    };
    public func bitshiftLeft(a: Int, b: Nat, max: Int, min: Int): Int {
        var i = 0;
        var result: Int = a;
        while (i < b) {
            result := truncate(result + result, max, min);
            i := i + 1;
        };
        return result;
    };
    public func bitshiftRight(a: Int, b: Nat, max: Int, min: Int): Int {
        var i = 0;
        var result: Int = a;
        while (i < b) {
            if (result < 0) {
                result := truncate(bitnot(bitnot(result, max, min) / 2, max, min), max, min);
            } else {
                result := truncate(result / 2, max, min);
            };
            i := i + 1;
        };
        return result;
    };
    public func add(a: Int, b: Int, max: Int, min: Int): Int {
        return truncate(a + b, max, min);
    };
    public func sub(a: Int, b: Int, max: Int, min: Int): Int {
        return truncate(a - b, max, min);
    };
    public func mul(a: Int, b: Int, max: Int, min: Int): Int {
        return truncate(a * b, max, min);
    };
    public func div(a: Int, b: Int, max: Int, min: Int): Int {
        return truncate(a / b, max, min);
    };
    public func rem(a: Int, b: Int, max: Int, min: Int): Int {
        return truncate(a % b, max, min);
    };
    public func bitnot(x: Int, max: Int, min: Int): Int {
        return -x - 1;
    };

}