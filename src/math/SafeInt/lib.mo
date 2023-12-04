import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import BitwiseInt "../BitwiseInt";
import IntUtils "./IntUtils";
import UintUtils "../SafeUint/UintUtils";
import SafeUint "../SafeUint";

module SafeInt {
    
    public let INT_8_MAX: Int = 127;
    public let INT_8_MIN: Int = -128;
    public let INT_16_MAX: Int = 32767;
    public let INT_16_MIN: Int = -32768;
    public let INT_24_MAX: Int = 8388607;
    public let INT_24_MIN: Int = -8388608;
    public let INT_32_MAX: Int = 2147483647;
    public let INT_32_MIN: Int = -2147483648;
    public let INT_48_MAX: Int = 140737488355327;
    public let INT_48_MIN: Int = -140737488355328;
    public let INT_56_MAX: Int = 36028797018963967;
    public let INT_56_MIN: Int = -36028797018963968;
    public let INT_64_MAX: Int = 9223372036854775807;
    public let INT_64_MIN: Int = -9223372036854775808;
    public let INT_80_MAX: Int = 604462909807314587353087;
    public let INT_80_MIN: Int = -604462909807314587353088;
    public let INT_96_MAX: Int = 39614081257132168796771975167;
    public let INT_96_MIN: Int = -39614081257132168796771975168;
    public let INT_112_MAX: Int = 2596148429267413814265248164610047;
    public let INT_112_MIN: Int = -2596148429267413814265248164610048;
    public let INT_128_MAX: Int = 170141183460469231731687303715884105727;
    public let INT_128_MIN: Int = -170141183460469231731687303715884105728;
    public let INT_144_MAX: Int = 11150372599265311570767859136324180752990207;
    public let INT_144_MIN: Int = -11150372599265311570767859136324180752990208;
    public let INT_160_MAX: Int = 730750818665451459101842416358141509827966271487;
    public let INT_160_MIN: Int = -730750818665451459101842416358141509827966271488;
    public let INT_176_MAX: Int = 47890485652059026823698344598447161988085597568237567;
    public let INT_176_MIN: Int = -47890485652059026823698344598447161988085597568237568;
    public let INT_192_MAX: Int = 3138550867693340381917894711603833208051177722232017256447;
    public let INT_192_MIN: Int = -3138550867693340381917894711603833208051177722232017256448;
    public let INT_224_MAX: Int = 13479973333575319897333507543509815336818572211270286240551805124607;
    public let INT_224_MIN: Int = -13479973333575319897333507543509815336818572211270286240551805124608;
    public let INT_256_MAX: Int = 57896044618658097711785492504343953926634992332820282019728792003956564819967;
    public let INT_256_MIN: Int = -57896044618658097711785492504343953926634992332820282019728792003956564819968;
    public let INT_512_MAX: Int = 6703903964971298549787012499102923063739682910296196688861780721860882015036773488400937149083451713845015929093243025426876941405973284973216824503042047;
    public let INT_512_MIN: Int = -6703903964971298549787012499102923063739682910296196688861780721860882015036773488400937149083451713845015929093243025426876941405973284973216824503042048;
    private func _assert(v: Int, max: Int, min: Int): Int {
        if (v > max or v < min) {
            return IntUtils.truncate(v, max, min);
        } else {
            return v;
        };
        
    };

    public class Int8(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_8_MAX, INT_8_MIN);
        public func neg(): Int8 { Int8(if (_this == INT_8_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int8): Int8 { Int8(IntUtils.add(_this, x.val(), INT_8_MAX, INT_8_MIN)) };
        public func sub(x: Int8): Int8 { Int8(IntUtils.sub(_this, x.val(), INT_8_MAX, INT_8_MIN)) };
        public func mul(x: Int8): Int8 { Int8(IntUtils.mul(_this, x.val(), INT_8_MAX, INT_8_MIN)) };
        public func div(x: Int8): Int8 { Int8(IntUtils.div(_this, x.val(), INT_8_MAX, INT_8_MIN)) };
        public func rem(x: Int8): Int8 { Int8(IntUtils.rem(_this, x.val(), INT_8_MAX, INT_8_MIN)) };
        public func pow(x: Int): Int8 { Int8(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 8), IntUtils.toNat(x, 8), SafeUint.UINT_8_MAX), 8)) };
        public func bitshiftLeft(x: Nat): Int8 { Int8(IntUtils.bitshiftLeft(_this, x, INT_8_MAX, INT_8_MIN)) };
        public func bitshiftRight(x: Nat): Int8 { Int8(IntUtils.bitshiftRight(_this, x, INT_8_MAX, INT_8_MIN)) };
        public func bitand(x: Int8): Int8 { Int8(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 8), IntUtils.toNat(x.val(), 8), SafeUint.UINT_8_MAX), 8)) };
        public func bitor(x: Int8): Int8 { Int8(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 8), IntUtils.toNat(x.val(), 8), SafeUint.UINT_8_MAX), 8)) };
        public func bitxor(x: Int8): Int8 { Int8(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 8), IntUtils.toNat(x.val(), 8), SafeUint.UINT_8_MAX), 8)) };
        public func bitnot(): Int8 { Int8(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 8), SafeUint.UINT_8_MAX), 8)) };
        public func val(): Int { _this };
    };


    public class Int16(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_16_MAX, INT_16_MIN);
        public func neg(): Int16 { Int16(if (_this == INT_16_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int16): Int16 { Int16(IntUtils.add(_this, x.val(), INT_16_MAX, INT_16_MIN)) };
        public func sub(x: Int16): Int16 { Int16(IntUtils.sub(_this, x.val(), INT_16_MAX, INT_16_MIN)) };
        public func mul(x: Int16): Int16 { Int16(IntUtils.mul(_this, x.val(), INT_16_MAX, INT_16_MIN)) };
        public func div(x: Int16): Int16 { Int16(IntUtils.div(_this, x.val(), INT_16_MAX, INT_16_MIN)) };
        public func rem(x: Int16): Int16 { Int16(IntUtils.rem(_this, x.val(), INT_16_MAX, INT_16_MIN)) };
        public func pow(x: Int): Int16 { Int16(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 16), IntUtils.toNat(x, 16), SafeUint.UINT_16_MAX), 16)) };
        public func bitshiftLeft(x: Nat): Int16 { Int16(IntUtils.bitshiftLeft(_this, x, INT_16_MAX, INT_16_MIN)) };
        public func bitshiftRight(x: Nat): Int16 { Int16(IntUtils.bitshiftRight(_this, x, INT_16_MAX, INT_16_MIN)) };
        public func bitand(x: Int16): Int16 { Int16(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 16), IntUtils.toNat(x.val(), 16), SafeUint.UINT_16_MAX), 16)) };
        public func bitor(x: Int16): Int16 { Int16(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 16), IntUtils.toNat(x.val(), 16), SafeUint.UINT_16_MAX), 16)) };
        public func bitxor(x: Int16): Int16 { Int16(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 16), IntUtils.toNat(x.val(), 16), SafeUint.UINT_16_MAX), 16)) };
        public func bitnot(): Int16 { Int16(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 16), SafeUint.UINT_16_MAX), 16)) };
        public func val(): Int { _this };
    };


    public class Int24(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_24_MAX, INT_24_MIN);
        public func neg(): Int24 { Int24(if (_this == INT_24_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int24): Int24 { Int24(IntUtils.add(_this, x.val(), INT_24_MAX, INT_24_MIN)) };
        public func sub(x: Int24): Int24 { Int24(IntUtils.sub(_this, x.val(), INT_24_MAX, INT_24_MIN)) };
        public func mul(x: Int24): Int24 { Int24(IntUtils.mul(_this, x.val(), INT_24_MAX, INT_24_MIN)) };
        public func div(x: Int24): Int24 { Int24(IntUtils.div(_this, x.val(), INT_24_MAX, INT_24_MIN)) };
        public func rem(x: Int24): Int24 { Int24(IntUtils.rem(_this, x.val(), INT_24_MAX, INT_24_MIN)) };
        public func pow(x: Int): Int24 { Int24(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 24), IntUtils.toNat(x, 24), SafeUint.UINT_24_MAX), 24)) };
        public func bitshiftLeft(x: Nat): Int24 { Int24(IntUtils.bitshiftLeft(_this, x, INT_24_MAX, INT_24_MIN)) };
        public func bitshiftRight(x: Nat): Int24 { Int24(IntUtils.bitshiftRight(_this, x, INT_24_MAX, INT_24_MIN)) };
        public func bitand(x: Int24): Int24 { Int24(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 24), IntUtils.toNat(x.val(), 24), SafeUint.UINT_24_MAX), 24)) };
        public func bitor(x: Int24): Int24 { Int24(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 24), IntUtils.toNat(x.val(), 24), SafeUint.UINT_24_MAX), 24)) };
        public func bitxor(x: Int24): Int24 { Int24(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 24), IntUtils.toNat(x.val(), 24), SafeUint.UINT_24_MAX), 24)) };
        public func bitnot(): Int24 { Int24(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 24), SafeUint.UINT_24_MAX), 24)) };
        public func val(): Int { _this };
    };


    public class Int32(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_32_MAX, INT_32_MIN);
        public func neg(): Int32 { Int32(if (_this == INT_32_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int32): Int32 { Int32(IntUtils.add(_this, x.val(), INT_32_MAX, INT_32_MIN)) };
        public func sub(x: Int32): Int32 { Int32(IntUtils.sub(_this, x.val(), INT_32_MAX, INT_32_MIN)) };
        public func mul(x: Int32): Int32 { Int32(IntUtils.mul(_this, x.val(), INT_32_MAX, INT_32_MIN)) };
        public func div(x: Int32): Int32 { Int32(IntUtils.div(_this, x.val(), INT_32_MAX, INT_32_MIN)) };
        public func rem(x: Int32): Int32 { Int32(IntUtils.rem(_this, x.val(), INT_32_MAX, INT_32_MIN)) };
        public func pow(x: Int): Int32 { Int32(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 32), IntUtils.toNat(x, 32), SafeUint.UINT_32_MAX), 32)) };
        public func bitshiftLeft(x: Nat): Int32 { Int32(IntUtils.bitshiftLeft(_this, x, INT_32_MAX, INT_32_MIN)) };
        public func bitshiftRight(x: Nat): Int32 { Int32(IntUtils.bitshiftRight(_this, x, INT_32_MAX, INT_32_MIN)) };
        public func bitand(x: Int32): Int32 { Int32(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 32), IntUtils.toNat(x.val(), 32), SafeUint.UINT_32_MAX), 32)) };
        public func bitor(x: Int32): Int32 { Int32(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 32), IntUtils.toNat(x.val(), 32), SafeUint.UINT_32_MAX), 32)) };
        public func bitxor(x: Int32): Int32 { Int32(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 32), IntUtils.toNat(x.val(), 32), SafeUint.UINT_32_MAX), 32)) };
        public func bitnot(): Int32 { Int32(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 32), SafeUint.UINT_32_MAX), 32)) };
        public func val(): Int { _this };
    };


    public class Int48(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_48_MAX, INT_48_MIN);
        public func neg(): Int48 { Int48(if (_this == INT_48_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int48): Int48 { Int48(IntUtils.add(_this, x.val(), INT_48_MAX, INT_48_MIN)) };
        public func sub(x: Int48): Int48 { Int48(IntUtils.sub(_this, x.val(), INT_48_MAX, INT_48_MIN)) };
        public func mul(x: Int48): Int48 { Int48(IntUtils.mul(_this, x.val(), INT_48_MAX, INT_48_MIN)) };
        public func div(x: Int48): Int48 { Int48(IntUtils.div(_this, x.val(), INT_48_MAX, INT_48_MIN)) };
        public func rem(x: Int48): Int48 { Int48(IntUtils.rem(_this, x.val(), INT_48_MAX, INT_48_MIN)) };
        public func pow(x: Int): Int48 { Int48(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 48), IntUtils.toNat(x, 48), SafeUint.UINT_48_MAX), 48)) };
        public func bitshiftLeft(x: Nat): Int48 { Int48(IntUtils.bitshiftLeft(_this, x, INT_48_MAX, INT_48_MIN)) };
        public func bitshiftRight(x: Nat): Int48 { Int48(IntUtils.bitshiftRight(_this, x, INT_48_MAX, INT_48_MIN)) };
        public func bitand(x: Int48): Int48 { Int48(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 48), IntUtils.toNat(x.val(), 48), SafeUint.UINT_48_MAX), 48)) };
        public func bitor(x: Int48): Int48 { Int48(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 48), IntUtils.toNat(x.val(), 48), SafeUint.UINT_48_MAX), 48)) };
        public func bitxor(x: Int48): Int48 { Int48(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 48), IntUtils.toNat(x.val(), 48), SafeUint.UINT_48_MAX), 48)) };
        public func bitnot(): Int48 { Int48(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 48), SafeUint.UINT_48_MAX), 48)) };
        public func val(): Int { _this };
    };


    public class Int56(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_56_MAX, INT_56_MIN);
        public func neg(): Int56 { Int56(if (_this == INT_56_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int56): Int56 { Int56(IntUtils.add(_this, x.val(), INT_56_MAX, INT_56_MIN)) };
        public func sub(x: Int56): Int56 { Int56(IntUtils.sub(_this, x.val(), INT_56_MAX, INT_56_MIN)) };
        public func mul(x: Int56): Int56 { Int56(IntUtils.mul(_this, x.val(), INT_56_MAX, INT_56_MIN)) };
        public func div(x: Int56): Int56 { Int56(IntUtils.div(_this, x.val(), INT_56_MAX, INT_56_MIN)) };
        public func rem(x: Int56): Int56 { Int56(IntUtils.rem(_this, x.val(), INT_56_MAX, INT_56_MIN)) };
        public func pow(x: Int): Int56 { Int56(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 56), IntUtils.toNat(x, 56), SafeUint.UINT_56_MAX), 56)) };
        public func bitshiftLeft(x: Nat): Int56 { Int56(IntUtils.bitshiftLeft(_this, x, INT_56_MAX, INT_56_MIN)) };
        public func bitshiftRight(x: Nat): Int56 { Int56(IntUtils.bitshiftRight(_this, x, INT_56_MAX, INT_56_MIN)) };
        public func bitand(x: Int56): Int56 { Int56(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 56), IntUtils.toNat(x.val(), 56), SafeUint.UINT_56_MAX), 56)) };
        public func bitor(x: Int56): Int56 { Int56(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 56), IntUtils.toNat(x.val(), 56), SafeUint.UINT_56_MAX), 56)) };
        public func bitxor(x: Int56): Int56 { Int56(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 56), IntUtils.toNat(x.val(), 56), SafeUint.UINT_56_MAX), 56)) };
        public func bitnot(): Int56 { Int56(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 56), SafeUint.UINT_56_MAX), 56)) };
        public func val(): Int { _this };
    };


    public class Int64(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_64_MAX, INT_64_MIN);
        public func neg(): Int64 { Int64(if (_this == INT_64_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int64): Int64 { Int64(IntUtils.add(_this, x.val(), INT_64_MAX, INT_64_MIN)) };
        public func sub(x: Int64): Int64 { Int64(IntUtils.sub(_this, x.val(), INT_64_MAX, INT_64_MIN)) };
        public func mul(x: Int64): Int64 { Int64(IntUtils.mul(_this, x.val(), INT_64_MAX, INT_64_MIN)) };
        public func div(x: Int64): Int64 { Int64(IntUtils.div(_this, x.val(), INT_64_MAX, INT_64_MIN)) };
        public func rem(x: Int64): Int64 { Int64(IntUtils.rem(_this, x.val(), INT_64_MAX, INT_64_MIN)) };
        public func pow(x: Int): Int64 { Int64(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 64), IntUtils.toNat(x, 64), SafeUint.UINT_64_MAX), 64)) };
        public func bitshiftLeft(x: Nat): Int64 { Int64(IntUtils.bitshiftLeft(_this, x, INT_64_MAX, INT_64_MIN)) };
        public func bitshiftRight(x: Nat): Int64 { Int64(IntUtils.bitshiftRight(_this, x, INT_64_MAX, INT_64_MIN)) };
        public func bitand(x: Int64): Int64 { Int64(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 64), IntUtils.toNat(x.val(), 64), SafeUint.UINT_64_MAX), 64)) };
        public func bitor(x: Int64): Int64 { Int64(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 64), IntUtils.toNat(x.val(), 64), SafeUint.UINT_64_MAX), 64)) };
        public func bitxor(x: Int64): Int64 { Int64(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 64), IntUtils.toNat(x.val(), 64), SafeUint.UINT_64_MAX), 64)) };
        public func bitnot(): Int64 { Int64(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 64), SafeUint.UINT_64_MAX), 64)) };
        public func val(): Int { _this };
    };


    public class Int80(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_80_MAX, INT_80_MIN);
        public func neg(): Int80 { Int80(if (_this == INT_80_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int80): Int80 { Int80(IntUtils.add(_this, x.val(), INT_80_MAX, INT_80_MIN)) };
        public func sub(x: Int80): Int80 { Int80(IntUtils.sub(_this, x.val(), INT_80_MAX, INT_80_MIN)) };
        public func mul(x: Int80): Int80 { Int80(IntUtils.mul(_this, x.val(), INT_80_MAX, INT_80_MIN)) };
        public func div(x: Int80): Int80 { Int80(IntUtils.div(_this, x.val(), INT_80_MAX, INT_80_MIN)) };
        public func rem(x: Int80): Int80 { Int80(IntUtils.rem(_this, x.val(), INT_80_MAX, INT_80_MIN)) };
        public func pow(x: Int): Int80 { Int80(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 80), IntUtils.toNat(x, 80), SafeUint.UINT_80_MAX), 80)) };
        public func bitshiftLeft(x: Nat): Int80 { Int80(IntUtils.bitshiftLeft(_this, x, INT_80_MAX, INT_80_MIN)) };
        public func bitshiftRight(x: Nat): Int80 { Int80(IntUtils.bitshiftRight(_this, x, INT_80_MAX, INT_80_MIN)) };
        public func bitand(x: Int80): Int80 { Int80(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 80), IntUtils.toNat(x.val(), 80), SafeUint.UINT_80_MAX), 80)) };
        public func bitor(x: Int80): Int80 { Int80(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 80), IntUtils.toNat(x.val(), 80), SafeUint.UINT_80_MAX), 80)) };
        public func bitxor(x: Int80): Int80 { Int80(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 80), IntUtils.toNat(x.val(), 80), SafeUint.UINT_80_MAX), 80)) };
        public func bitnot(): Int80 { Int80(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 80), SafeUint.UINT_80_MAX), 80)) };
        public func val(): Int { _this };
    };


    public class Int96(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_96_MAX, INT_96_MIN);
        public func neg(): Int96 { Int96(if (_this == INT_96_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int96): Int96 { Int96(IntUtils.add(_this, x.val(), INT_96_MAX, INT_96_MIN)) };
        public func sub(x: Int96): Int96 { Int96(IntUtils.sub(_this, x.val(), INT_96_MAX, INT_96_MIN)) };
        public func mul(x: Int96): Int96 { Int96(IntUtils.mul(_this, x.val(), INT_96_MAX, INT_96_MIN)) };
        public func div(x: Int96): Int96 { Int96(IntUtils.div(_this, x.val(), INT_96_MAX, INT_96_MIN)) };
        public func rem(x: Int96): Int96 { Int96(IntUtils.rem(_this, x.val(), INT_96_MAX, INT_96_MIN)) };
        public func pow(x: Int): Int96 { Int96(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 96), IntUtils.toNat(x, 96), SafeUint.UINT_96_MAX), 96)) };
        public func bitshiftLeft(x: Nat): Int96 { Int96(IntUtils.bitshiftLeft(_this, x, INT_96_MAX, INT_96_MIN)) };
        public func bitshiftRight(x: Nat): Int96 { Int96(IntUtils.bitshiftRight(_this, x, INT_96_MAX, INT_96_MIN)) };
        public func bitand(x: Int96): Int96 { Int96(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 96), IntUtils.toNat(x.val(), 96), SafeUint.UINT_96_MAX), 96)) };
        public func bitor(x: Int96): Int96 { Int96(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 96), IntUtils.toNat(x.val(), 96), SafeUint.UINT_96_MAX), 96)) };
        public func bitxor(x: Int96): Int96 { Int96(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 96), IntUtils.toNat(x.val(), 96), SafeUint.UINT_96_MAX), 96)) };
        public func bitnot(): Int96 { Int96(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 96), SafeUint.UINT_96_MAX), 96)) };
        public func val(): Int { _this };
    };


    public class Int112(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_112_MAX, INT_112_MIN);
        public func neg(): Int112 { Int112(if (_this == INT_112_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int112): Int112 { Int112(IntUtils.add(_this, x.val(), INT_112_MAX, INT_112_MIN)) };
        public func sub(x: Int112): Int112 { Int112(IntUtils.sub(_this, x.val(), INT_112_MAX, INT_112_MIN)) };
        public func mul(x: Int112): Int112 { Int112(IntUtils.mul(_this, x.val(), INT_112_MAX, INT_112_MIN)) };
        public func div(x: Int112): Int112 { Int112(IntUtils.div(_this, x.val(), INT_112_MAX, INT_112_MIN)) };
        public func rem(x: Int112): Int112 { Int112(IntUtils.rem(_this, x.val(), INT_112_MAX, INT_112_MIN)) };
        public func pow(x: Int): Int112 { Int112(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 112), IntUtils.toNat(x, 112), SafeUint.UINT_112_MAX), 112)) };
        public func bitshiftLeft(x: Nat): Int112 { Int112(IntUtils.bitshiftLeft(_this, x, INT_112_MAX, INT_112_MIN)) };
        public func bitshiftRight(x: Nat): Int112 { Int112(IntUtils.bitshiftRight(_this, x, INT_112_MAX, INT_112_MIN)) };
        public func bitand(x: Int112): Int112 { Int112(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 112), IntUtils.toNat(x.val(), 112), SafeUint.UINT_112_MAX), 112)) };
        public func bitor(x: Int112): Int112 { Int112(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 112), IntUtils.toNat(x.val(), 112), SafeUint.UINT_112_MAX), 112)) };
        public func bitxor(x: Int112): Int112 { Int112(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 112), IntUtils.toNat(x.val(), 112), SafeUint.UINT_112_MAX), 112)) };
        public func bitnot(): Int112 { Int112(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 112), SafeUint.UINT_112_MAX), 112)) };
        public func val(): Int { _this };
    };


    public class Int128(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_128_MAX, INT_128_MIN);
        public func neg(): Int128 { Int128(if (_this == INT_128_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int128): Int128 { Int128(IntUtils.add(_this, x.val(), INT_128_MAX, INT_128_MIN)) };
        public func sub(x: Int128): Int128 { Int128(IntUtils.sub(_this, x.val(), INT_128_MAX, INT_128_MIN)) };
        public func mul(x: Int128): Int128 { Int128(IntUtils.mul(_this, x.val(), INT_128_MAX, INT_128_MIN)) };
        public func div(x: Int128): Int128 { Int128(IntUtils.div(_this, x.val(), INT_128_MAX, INT_128_MIN)) };
        public func rem(x: Int128): Int128 { Int128(IntUtils.rem(_this, x.val(), INT_128_MAX, INT_128_MIN)) };
        public func pow(x: Int): Int128 { Int128(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 128), IntUtils.toNat(x, 128), SafeUint.UINT_128_MAX), 128)) };
        public func bitshiftLeft(x: Nat): Int128 { Int128(IntUtils.bitshiftLeft(_this, x, INT_128_MAX, INT_128_MIN)) };
        public func bitshiftRight(x: Nat): Int128 { Int128(IntUtils.bitshiftRight(_this, x, INT_128_MAX, INT_128_MIN)) };
        public func bitand(x: Int128): Int128 { Int128(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 128), IntUtils.toNat(x.val(), 128), SafeUint.UINT_128_MAX), 128)) };
        public func bitor(x: Int128): Int128 { Int128(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 128), IntUtils.toNat(x.val(), 128), SafeUint.UINT_128_MAX), 128)) };
        public func bitxor(x: Int128): Int128 { Int128(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 128), IntUtils.toNat(x.val(), 128), SafeUint.UINT_128_MAX), 128)) };
        public func bitnot(): Int128 { Int128(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 128), SafeUint.UINT_128_MAX), 128)) };
        public func val(): Int { _this };
    };


    public class Int144(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_144_MAX, INT_144_MIN);
        public func neg(): Int144 { Int144(if (_this == INT_144_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int144): Int144 { Int144(IntUtils.add(_this, x.val(), INT_144_MAX, INT_144_MIN)) };
        public func sub(x: Int144): Int144 { Int144(IntUtils.sub(_this, x.val(), INT_144_MAX, INT_144_MIN)) };
        public func mul(x: Int144): Int144 { Int144(IntUtils.mul(_this, x.val(), INT_144_MAX, INT_144_MIN)) };
        public func div(x: Int144): Int144 { Int144(IntUtils.div(_this, x.val(), INT_144_MAX, INT_144_MIN)) };
        public func rem(x: Int144): Int144 { Int144(IntUtils.rem(_this, x.val(), INT_144_MAX, INT_144_MIN)) };
        public func pow(x: Int): Int144 { Int144(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 144), IntUtils.toNat(x, 144), SafeUint.UINT_144_MAX), 144)) };
        public func bitshiftLeft(x: Nat): Int144 { Int144(IntUtils.bitshiftLeft(_this, x, INT_144_MAX, INT_144_MIN)) };
        public func bitshiftRight(x: Nat): Int144 { Int144(IntUtils.bitshiftRight(_this, x, INT_144_MAX, INT_144_MIN)) };
        public func bitand(x: Int144): Int144 { Int144(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 144), IntUtils.toNat(x.val(), 144), SafeUint.UINT_144_MAX), 144)) };
        public func bitor(x: Int144): Int144 { Int144(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 144), IntUtils.toNat(x.val(), 144), SafeUint.UINT_144_MAX), 144)) };
        public func bitxor(x: Int144): Int144 { Int144(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 144), IntUtils.toNat(x.val(), 144), SafeUint.UINT_144_MAX), 144)) };
        public func bitnot(): Int144 { Int144(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 144), SafeUint.UINT_144_MAX), 144)) };
        public func val(): Int { _this };
    };


    public class Int160(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_160_MAX, INT_160_MIN);
        public func neg(): Int160 { Int160(if (_this == INT_160_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int160): Int160 { Int160(IntUtils.add(_this, x.val(), INT_160_MAX, INT_160_MIN)) };
        public func sub(x: Int160): Int160 { Int160(IntUtils.sub(_this, x.val(), INT_160_MAX, INT_160_MIN)) };
        public func mul(x: Int160): Int160 { Int160(IntUtils.mul(_this, x.val(), INT_160_MAX, INT_160_MIN)) };
        public func div(x: Int160): Int160 { Int160(IntUtils.div(_this, x.val(), INT_160_MAX, INT_160_MIN)) };
        public func rem(x: Int160): Int160 { Int160(IntUtils.rem(_this, x.val(), INT_160_MAX, INT_160_MIN)) };
        public func pow(x: Int): Int160 { Int160(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 160), IntUtils.toNat(x, 160), SafeUint.UINT_160_MAX), 160)) };
        public func bitshiftLeft(x: Nat): Int160 { Int160(IntUtils.bitshiftLeft(_this, x, INT_160_MAX, INT_160_MIN)) };
        public func bitshiftRight(x: Nat): Int160 { Int160(IntUtils.bitshiftRight(_this, x, INT_160_MAX, INT_160_MIN)) };
        public func bitand(x: Int160): Int160 { Int160(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 160), IntUtils.toNat(x.val(), 160), SafeUint.UINT_160_MAX), 160)) };
        public func bitor(x: Int160): Int160 { Int160(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 160), IntUtils.toNat(x.val(), 160), SafeUint.UINT_160_MAX), 160)) };
        public func bitxor(x: Int160): Int160 { Int160(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 160), IntUtils.toNat(x.val(), 160), SafeUint.UINT_160_MAX), 160)) };
        public func bitnot(): Int160 { Int160(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 160), SafeUint.UINT_160_MAX), 160)) };
        public func val(): Int { _this };
    };


    public class Int176(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_176_MAX, INT_176_MIN);
        public func neg(): Int176 { Int176(if (_this == INT_176_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int176): Int176 { Int176(IntUtils.add(_this, x.val(), INT_176_MAX, INT_176_MIN)) };
        public func sub(x: Int176): Int176 { Int176(IntUtils.sub(_this, x.val(), INT_176_MAX, INT_176_MIN)) };
        public func mul(x: Int176): Int176 { Int176(IntUtils.mul(_this, x.val(), INT_176_MAX, INT_176_MIN)) };
        public func div(x: Int176): Int176 { Int176(IntUtils.div(_this, x.val(), INT_176_MAX, INT_176_MIN)) };
        public func rem(x: Int176): Int176 { Int176(IntUtils.rem(_this, x.val(), INT_176_MAX, INT_176_MIN)) };
        public func pow(x: Int): Int176 { Int176(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 176), IntUtils.toNat(x, 176), SafeUint.UINT_176_MAX), 176)) };
        public func bitshiftLeft(x: Nat): Int176 { Int176(IntUtils.bitshiftLeft(_this, x, INT_176_MAX, INT_176_MIN)) };
        public func bitshiftRight(x: Nat): Int176 { Int176(IntUtils.bitshiftRight(_this, x, INT_176_MAX, INT_176_MIN)) };
        public func bitand(x: Int176): Int176 { Int176(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 176), IntUtils.toNat(x.val(), 176), SafeUint.UINT_176_MAX), 176)) };
        public func bitor(x: Int176): Int176 { Int176(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 176), IntUtils.toNat(x.val(), 176), SafeUint.UINT_176_MAX), 176)) };
        public func bitxor(x: Int176): Int176 { Int176(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 176), IntUtils.toNat(x.val(), 176), SafeUint.UINT_176_MAX), 176)) };
        public func bitnot(): Int176 { Int176(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 176), SafeUint.UINT_176_MAX), 176)) };
        public func val(): Int { _this };
    };


    public class Int192(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_192_MAX, INT_192_MIN);
        public func neg(): Int192 { Int192(if (_this == INT_192_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int192): Int192 { Int192(IntUtils.add(_this, x.val(), INT_192_MAX, INT_192_MIN)) };
        public func sub(x: Int192): Int192 { Int192(IntUtils.sub(_this, x.val(), INT_192_MAX, INT_192_MIN)) };
        public func mul(x: Int192): Int192 { Int192(IntUtils.mul(_this, x.val(), INT_192_MAX, INT_192_MIN)) };
        public func div(x: Int192): Int192 { Int192(IntUtils.div(_this, x.val(), INT_192_MAX, INT_192_MIN)) };
        public func rem(x: Int192): Int192 { Int192(IntUtils.rem(_this, x.val(), INT_192_MAX, INT_192_MIN)) };
        public func pow(x: Int): Int192 { Int192(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 192), IntUtils.toNat(x, 192), SafeUint.UINT_192_MAX), 192)) };
        public func bitshiftLeft(x: Nat): Int192 { Int192(IntUtils.bitshiftLeft(_this, x, INT_192_MAX, INT_192_MIN)) };
        public func bitshiftRight(x: Nat): Int192 { Int192(IntUtils.bitshiftRight(_this, x, INT_192_MAX, INT_192_MIN)) };
        public func bitand(x: Int192): Int192 { Int192(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 192), IntUtils.toNat(x.val(), 192), SafeUint.UINT_192_MAX), 192)) };
        public func bitor(x: Int192): Int192 { Int192(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 192), IntUtils.toNat(x.val(), 192), SafeUint.UINT_192_MAX), 192)) };
        public func bitxor(x: Int192): Int192 { Int192(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 192), IntUtils.toNat(x.val(), 192), SafeUint.UINT_192_MAX), 192)) };
        public func bitnot(): Int192 { Int192(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 192), SafeUint.UINT_192_MAX), 192)) };
        public func val(): Int { _this };
    };


    public class Int224(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_224_MAX, INT_224_MIN);
        public func neg(): Int224 { Int224(if (_this == INT_224_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int224): Int224 { Int224(IntUtils.add(_this, x.val(), INT_224_MAX, INT_224_MIN)) };
        public func sub(x: Int224): Int224 { Int224(IntUtils.sub(_this, x.val(), INT_224_MAX, INT_224_MIN)) };
        public func mul(x: Int224): Int224 { Int224(IntUtils.mul(_this, x.val(), INT_224_MAX, INT_224_MIN)) };
        public func div(x: Int224): Int224 { Int224(IntUtils.div(_this, x.val(), INT_224_MAX, INT_224_MIN)) };
        public func rem(x: Int224): Int224 { Int224(IntUtils.rem(_this, x.val(), INT_224_MAX, INT_224_MIN)) };
        public func pow(x: Int): Int224 { Int224(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 224), IntUtils.toNat(x, 224), SafeUint.UINT_224_MAX), 224)) };
        public func bitshiftLeft(x: Nat): Int224 { Int224(IntUtils.bitshiftLeft(_this, x, INT_224_MAX, INT_224_MIN)) };
        public func bitshiftRight(x: Nat): Int224 { Int224(IntUtils.bitshiftRight(_this, x, INT_224_MAX, INT_224_MIN)) };
        public func bitand(x: Int224): Int224 { Int224(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 224), IntUtils.toNat(x.val(), 224), SafeUint.UINT_224_MAX), 224)) };
        public func bitor(x: Int224): Int224 { Int224(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 224), IntUtils.toNat(x.val(), 224), SafeUint.UINT_224_MAX), 224)) };
        public func bitxor(x: Int224): Int224 { Int224(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 224), IntUtils.toNat(x.val(), 224), SafeUint.UINT_224_MAX), 224)) };
        public func bitnot(): Int224 { Int224(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 224), SafeUint.UINT_224_MAX), 224)) };
        public func val(): Int { _this };
    };


    public class Int256(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_256_MAX, INT_256_MIN);
        public func neg(): Int256 { Int256(if (_this == INT_256_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int256): Int256 { Int256(IntUtils.add(_this, x.val(), INT_256_MAX, INT_256_MIN)) };
        public func sub(x: Int256): Int256 { Int256(IntUtils.sub(_this, x.val(), INT_256_MAX, INT_256_MIN)) };
        public func mul(x: Int256): Int256 { Int256(IntUtils.mul(_this, x.val(), INT_256_MAX, INT_256_MIN)) };
        public func div(x: Int256): Int256 { Int256(IntUtils.div(_this, x.val(), INT_256_MAX, INT_256_MIN)) };
        public func rem(x: Int256): Int256 { Int256(IntUtils.rem(_this, x.val(), INT_256_MAX, INT_256_MIN)) };
        public func pow(x: Int): Int256 { Int256(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 256), IntUtils.toNat(x, 256), SafeUint.UINT_256_MAX), 256)) };
        public func bitshiftLeft(x: Nat): Int256 { Int256(IntUtils.bitshiftLeft(_this, x, INT_256_MAX, INT_256_MIN)) };
        public func bitshiftRight(x: Nat): Int256 { Int256(IntUtils.bitshiftRight(_this, x, INT_256_MAX, INT_256_MIN)) };
        public func bitand(x: Int256): Int256 { Int256(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 256), IntUtils.toNat(x.val(), 256), SafeUint.UINT_256_MAX), 256)) };
        public func bitor(x: Int256): Int256 { Int256(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 256), IntUtils.toNat(x.val(), 256), SafeUint.UINT_256_MAX), 256)) };
        public func bitxor(x: Int256): Int256 { Int256(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 256), IntUtils.toNat(x.val(), 256), SafeUint.UINT_256_MAX), 256)) };
        public func bitnot(): Int256 { Int256(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 256), SafeUint.UINT_256_MAX), 256)) };
        public func val(): Int { _this };
    };


    public class Int512(initVal: Int) = this {
        private var _this: Int = _assert(initVal, INT_512_MAX, INT_512_MIN);
        public func neg(): Int512 { Int512(if (_this == INT_512_MIN or _this == 0) { _this } else { -_this }) };
        public func add(x: Int512): Int512 { Int512(IntUtils.add(_this, x.val(), INT_512_MAX, INT_512_MIN)) };
        public func sub(x: Int512): Int512 { Int512(IntUtils.sub(_this, x.val(), INT_512_MAX, INT_512_MIN)) };
        public func mul(x: Int512): Int512 { Int512(IntUtils.mul(_this, x.val(), INT_512_MAX, INT_512_MIN)) };
        public func div(x: Int512): Int512 { Int512(IntUtils.div(_this, x.val(), INT_512_MAX, INT_512_MIN)) };
        public func rem(x: Int512): Int512 { Int512(IntUtils.rem(_this, x.val(), INT_512_MAX, INT_512_MIN)) };
        public func pow(x: Int): Int512 { Int512(IntUtils.toInt(UintUtils.pow(IntUtils.toNat(_this, 512), IntUtils.toNat(x, 512), SafeUint.UINT_512_MAX), 512)) };
        public func bitshiftLeft(x: Nat): Int512 { Int512(IntUtils.bitshiftLeft(_this, x, INT_512_MAX, INT_512_MIN)) };
        public func bitshiftRight(x: Nat): Int512 { Int512(IntUtils.bitshiftRight(_this, x, INT_512_MAX, INT_512_MIN)) };
        public func bitand(x: Int512): Int512 { Int512(IntUtils.toInt(UintUtils.bitand(IntUtils.toNat(_this, 512), IntUtils.toNat(x.val(), 512), SafeUint.UINT_512_MAX), 512)) };
        public func bitor(x: Int512): Int512 { Int512(IntUtils.toInt(UintUtils.bitor(IntUtils.toNat(_this, 512), IntUtils.toNat(x.val(), 512), SafeUint.UINT_512_MAX), 512)) };
        public func bitxor(x: Int512): Int512 { Int512(IntUtils.toInt(UintUtils.bitxor(IntUtils.toNat(_this, 512), IntUtils.toNat(x.val(), 512), SafeUint.UINT_512_MAX), 512)) };
        public func bitnot(): Int512 { Int512(IntUtils.toInt(UintUtils.bitnot(IntUtils.toNat(_this, 512), SafeUint.UINT_512_MAX), 512)) };
        public func val(): Int { _this };
    };

}