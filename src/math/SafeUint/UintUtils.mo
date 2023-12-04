import Nat "mo:base/Nat";
import BitwiseNat "../BitwiseNat";

module {
    public func truncate(x: Nat, max: Nat): Nat {
        if (x > max) {
            return x % (max + 1);
        } else {
            return x;
        };
    };
    public func neg(x: Nat, max: Nat): Nat {
        if (x == 0) {
            return 0;
        } else {
            return max + 1 - truncate(x, max);
        };
    };
    public func add(x: Nat, y: Nat, max: Nat): Nat {
        return truncate(x + y, max);
    };
    public func sub(x: Nat, y: Nat, max: Nat): Nat {
        if (x >= y) {
            return x - y;
        } else {
            return (max + 1) - (y - x);
        };
    };
    public func mul(x: Nat, y: Nat, max: Nat): Nat {
        return truncate(x * y, max);
    };
    public func div(x: Nat, y: Nat, max: Nat): Nat {
        return truncate(x / y, max);
    };
    public func rem(x: Nat, y: Nat, max: Nat): Nat {
        return truncate(x % y, max);
    };
    public func pow(x: Nat, y: Nat, max: Nat): Nat {
        return truncate(x ** y, max);
    };
    // public func bitshiftLeft(x: Nat, y: Nat, max: Nat) : Nat {
    //     return truncate(x * (2 ** y), max);
    // };
    // public func bitshiftRight(x: Nat, y: Nat) : Nat {
    //     return x / (2 ** y);
    // };

    public func bitshiftLeft(a: Nat, b: Nat, max: Nat): Nat {
        var i = 0;
        var result: Nat = a;
        while (i < b) {
            result := truncate(result + result, max);
            i := i + 1;
        };
        return result;
    };
    public func bitshiftRight(a: Nat, b: Nat, max: Nat): Nat {
        var i = 0;
        var result: Nat = a;
        while (i < b) {
            result := truncate(result / 2, max);
            i := i + 1;
        };
        return result;
    };

    public func bitand(x: Nat, y: Nat, max: Nat): Nat {
        return truncate(BitwiseNat.bitand(x, y), max);
    };
    public func bitor(x: Nat, y: Nat, max: Nat): Nat {
        return truncate(BitwiseNat.bitor(x, y), max);
    };
    public func bitxor(x: Nat, y: Nat, max: Nat): Nat {
        return truncate(BitwiseNat.bitxor(x, y), max);
    };
    public func bitnot(x: Nat, max: Nat): Nat {
        return truncate(max - x, max);
    };
}