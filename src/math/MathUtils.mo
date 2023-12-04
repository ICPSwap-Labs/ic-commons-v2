import Int "mo:base/Int";
import Debug "mo:base/Debug";
import BitwiseInt "./BitwiseInt";

module Uint {
    private let MAX_160: Int = 0x6FFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
    private let BIT_160: Int = 0xFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
    private let BIT_256: Int = 256;
    private let MAX_256: Int = 0x6FFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
    
    public func comp(r: Int, bit: Int, m: Int): Int {
        if (BitwiseInt.bitshiftRight(r, bit - 1) == 1) {
            Debug.print("==> bit 0 is 1");
            return -(Int.sub(m, Int.add(r, 1))) - 1;
        } else {
            Debug.print("==> bit 0 is 0");
            return r;
        }
    };
    public func _add(a: Int, b: Int, bit: Int, max: Int): Int {
        return comp((a + b) % max, bit, max);
    };
    public func _sub(a: Int, b: Int, bit: Int, max: Int): Int {
        return comp((a - b) % max, bit, max);
    };
    public func _mul(a: Int, b: Int, bit: Int, max: Int): Int {
        let max: Int = 2 ** bit;
        return comp((a * b) % max, bit, max);
    };
    public func _div(a: Int, b: Int, bit: Int, max: Int): Int {
        let max: Int = 2 ** bit;
        return comp((a / b) % max, bit, max);
    };
    public func _rem(a: Int, b: Int, bit: Int, max: Int): Int {
        return a % b;
    };
    public func _pow(a: Int, b: Int, bit: Int, max: Int): Int {
        return comp((a ** b) % max, bit, max);
    };
    public func _shiftLeft(a: Int, b: Int, bit: Int, max: Int): Int {
        return comp(BitwiseInt.bitshiftLeft(a, b) % max, bit, max);
    };
    public func _shiftRight(a: Int, b: Int, bit: Int, max: Int): Int {
        return comp(BitwiseInt.bitshiftRight(a, b), bit, max);
    };
    public func _bitnot(a: Int, bit: Int, max: Int): Int {
        return comp(BitwiseInt.bitnot(a), bit, max);
    };
    public func _bitand(a: Int, b: Int, bit: Int, max: Int): Int {
        return comp(BitwiseInt.bitand(a, b), bit, max);
    };
    public func _bitor(a: Int, b: Int, bit: Int, max: Int): Int {
        return comp(BitwiseInt.bitor(a, b), bit, max);
    };
    public func _bitxor(a: Int, b: Int, bit: Int, max: Int): Int {
        return comp(BitwiseInt.bitxor(a, b), bit, max);
    };
}