import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import BitwiseInt "../BitwiseInt";
import UintUtils "./UintUtils";

module SafeUint {

    public let UINT_1_MAX: Nat = 1;
    public let UINT_2_MAX: Nat = 3;
    public let UINT_4_MAX: Nat = 15;
    public let UINT_8_MAX: Nat = 255;
    public let UINT_16_MAX: Nat = 65535;
    public let UINT_24_MAX: Nat = 16777215;
    public let UINT_32_MAX: Nat = 4294967295;
    public let UINT_48_MAX: Nat = 281474976710655;
    public let UINT_56_MAX: Nat = 72057594037927935;
    public let UINT_64_MAX: Nat = 18446744073709551615;
    public let UINT_80_MAX: Nat = 1208925819614629174706175;
    public let UINT_96_MAX: Nat = 79228162514264337593543950335;
    public let UINT_112_MAX: Nat = 5192296858534827628530496329220095;
    public let UINT_128_MAX: Nat = 340282366920938463463374607431768211455;
    public let UINT_144_MAX: Nat = 22300745198530623141535718272648361505980415;
    public let UINT_160_MAX: Nat = 1461501637330902918203684832716283019655932542975;
    public let UINT_176_MAX: Nat = 95780971304118053647396689196894323976171195136475135;
    public let UINT_192_MAX: Nat = 6277101735386680763835789423207666416102355444464034512895;
    public let UINT_224_MAX: Nat = 26959946667150639794667015087019630673637144422540572481103610249215;
    public let UINT_256_MAX: Nat = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    public let UINT_512_MAX: Nat = 13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084095;
    private func _assert(v: Nat, max: Nat): Nat {
        if (v > max) {
            return UintUtils.truncate(v, max);
        } else {
            return v;
        };
    };

    public class Uint8(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_8_MAX);
        public func neg(): Uint8 { Uint8(UintUtils.neg(_this, UINT_8_MAX)) };
        public func add(x: Uint8): Uint8 { Uint8(UintUtils.add(_this, x.val(), UINT_8_MAX)) };
        public func sub(x: Uint8): Uint8 { Uint8(UintUtils.sub(_this, x.val(), UINT_8_MAX)) };
        public func mul(x: Uint8): Uint8 { Uint8(UintUtils.mul(_this, x.val(), UINT_8_MAX)) };
        public func div(x: Uint8): Uint8 { Uint8(UintUtils.div(_this, x.val(), UINT_8_MAX)) };
        public func rem(x: Uint8): Uint8 { Uint8(UintUtils.rem(_this, x.val(), UINT_8_MAX)) };
        public func pow(x: Nat): Uint8 { Uint8(UintUtils.pow(_this, x, UINT_8_MAX)) };
        public func bitshiftLeft(x: Nat): Uint8 { Uint8(UintUtils.bitshiftLeft(_this, x, UINT_8_MAX)) };
        public func bitshiftRight(x: Nat): Uint8 { Uint8(UintUtils.bitshiftRight(_this, x, UINT_8_MAX)) };
        public func bitand(x: Uint8): Uint8 { Uint8(UintUtils.bitand(_this, x.val(), UINT_8_MAX)) };
        public func bitor(x: Uint8): Uint8 { Uint8(UintUtils.bitor(_this, x.val(), UINT_8_MAX)) };
        public func bitxor(x: Uint8): Uint8 { Uint8(UintUtils.bitxor(_this, x.val(), UINT_8_MAX)) };
        public func bitnot(): Uint8 { Uint8(UintUtils.bitnot(_this, UINT_8_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint16(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_16_MAX);
        public func neg(): Uint16 { Uint16(UintUtils.neg(_this, UINT_16_MAX)) };
        public func add(x: Uint16): Uint16 { Uint16(UintUtils.add(_this, x.val(), UINT_16_MAX)) };
        public func sub(x: Uint16): Uint16 { Uint16(UintUtils.sub(_this, x.val(), UINT_16_MAX)) };
        public func mul(x: Uint16): Uint16 { Uint16(UintUtils.mul(_this, x.val(), UINT_16_MAX)) };
        public func div(x: Uint16): Uint16 { Uint16(UintUtils.div(_this, x.val(), UINT_16_MAX)) };
        public func rem(x: Uint16): Uint16 { Uint16(UintUtils.rem(_this, x.val(), UINT_16_MAX)) };
        public func pow(x: Nat): Uint16 { Uint16(UintUtils.pow(_this, x, UINT_16_MAX)) };
        public func bitshiftLeft(x: Nat): Uint16 { Uint16(UintUtils.bitshiftLeft(_this, x, UINT_16_MAX)) };
        public func bitshiftRight(x: Nat): Uint16 { Uint16(UintUtils.bitshiftRight(_this, x, UINT_16_MAX)) };
        public func bitand(x: Uint16): Uint16 { Uint16(UintUtils.bitand(_this, x.val(), UINT_16_MAX)) };
        public func bitor(x: Uint16): Uint16 { Uint16(UintUtils.bitor(_this, x.val(), UINT_16_MAX)) };
        public func bitxor(x: Uint16): Uint16 { Uint16(UintUtils.bitxor(_this, x.val(), UINT_16_MAX)) };
        public func bitnot(): Uint16 { Uint16(UintUtils.bitnot(_this, UINT_16_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint24(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_24_MAX);
        public func neg(): Uint24 { Uint24(UintUtils.neg(_this, UINT_24_MAX)) };
        public func add(x: Uint24): Uint24 { Uint24(UintUtils.add(_this, x.val(), UINT_24_MAX)) };
        public func sub(x: Uint24): Uint24 { Uint24(UintUtils.sub(_this, x.val(), UINT_24_MAX)) };
        public func mul(x: Uint24): Uint24 { Uint24(UintUtils.mul(_this, x.val(), UINT_24_MAX)) };
        public func div(x: Uint24): Uint24 { Uint24(UintUtils.div(_this, x.val(), UINT_24_MAX)) };
        public func rem(x: Uint24): Uint24 { Uint24(UintUtils.rem(_this, x.val(), UINT_24_MAX)) };
        public func pow(x: Nat): Uint24 { Uint24(UintUtils.pow(_this, x, UINT_24_MAX)) };
        public func bitshiftLeft(x: Nat): Uint24 { Uint24(UintUtils.bitshiftLeft(_this, x, UINT_24_MAX)) };
        public func bitshiftRight(x: Nat): Uint24 { Uint24(UintUtils.bitshiftRight(_this, x, UINT_24_MAX)) };
        public func bitand(x: Uint24): Uint24 { Uint24(UintUtils.bitand(_this, x.val(), UINT_24_MAX)) };
        public func bitor(x: Uint24): Uint24 { Uint24(UintUtils.bitor(_this, x.val(), UINT_24_MAX)) };
        public func bitxor(x: Uint24): Uint24 { Uint24(UintUtils.bitxor(_this, x.val(), UINT_24_MAX)) };
        public func bitnot(): Uint24 { Uint24(UintUtils.bitnot(_this, UINT_24_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint32(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_32_MAX);
        public func neg(): Uint32 { Uint32(UintUtils.neg(_this, UINT_32_MAX)) };
        public func add(x: Uint32): Uint32 { Uint32(UintUtils.add(_this, x.val(), UINT_32_MAX)) };
        public func sub(x: Uint32): Uint32 { Uint32(UintUtils.sub(_this, x.val(), UINT_32_MAX)) };
        public func mul(x: Uint32): Uint32 { Uint32(UintUtils.mul(_this, x.val(), UINT_32_MAX)) };
        public func div(x: Uint32): Uint32 { Uint32(UintUtils.div(_this, x.val(), UINT_32_MAX)) };
        public func rem(x: Uint32): Uint32 { Uint32(UintUtils.rem(_this, x.val(), UINT_32_MAX)) };
        public func pow(x: Nat): Uint32 { Uint32(UintUtils.pow(_this, x, UINT_32_MAX)) };
        public func bitshiftLeft(x: Nat): Uint32 { Uint32(UintUtils.bitshiftLeft(_this, x, UINT_32_MAX)) };
        public func bitshiftRight(x: Nat): Uint32 { Uint32(UintUtils.bitshiftRight(_this, x, UINT_32_MAX)) };
        public func bitand(x: Uint32): Uint32 { Uint32(UintUtils.bitand(_this, x.val(), UINT_32_MAX)) };
        public func bitor(x: Uint32): Uint32 { Uint32(UintUtils.bitor(_this, x.val(), UINT_32_MAX)) };
        public func bitxor(x: Uint32): Uint32 { Uint32(UintUtils.bitxor(_this, x.val(), UINT_32_MAX)) };
        public func bitnot(): Uint32 { Uint32(UintUtils.bitnot(_this, UINT_32_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint48(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_48_MAX);
        public func neg(): Uint48 { Uint48(UintUtils.neg(_this, UINT_48_MAX)) };
        public func add(x: Uint48): Uint48 { Uint48(UintUtils.add(_this, x.val(), UINT_48_MAX)) };
        public func sub(x: Uint48): Uint48 { Uint48(UintUtils.sub(_this, x.val(), UINT_48_MAX)) };
        public func mul(x: Uint48): Uint48 { Uint48(UintUtils.mul(_this, x.val(), UINT_48_MAX)) };
        public func div(x: Uint48): Uint48 { Uint48(UintUtils.div(_this, x.val(), UINT_48_MAX)) };
        public func rem(x: Uint48): Uint48 { Uint48(UintUtils.rem(_this, x.val(), UINT_48_MAX)) };
        public func pow(x: Nat): Uint48 { Uint48(UintUtils.pow(_this, x, UINT_48_MAX)) };
        public func bitshiftLeft(x: Nat): Uint48 { Uint48(UintUtils.bitshiftLeft(_this, x, UINT_48_MAX)) };
        public func bitshiftRight(x: Nat): Uint48 { Uint48(UintUtils.bitshiftRight(_this, x, UINT_48_MAX)) };
        public func bitand(x: Uint48): Uint48 { Uint48(UintUtils.bitand(_this, x.val(), UINT_48_MAX)) };
        public func bitor(x: Uint48): Uint48 { Uint48(UintUtils.bitor(_this, x.val(), UINT_48_MAX)) };
        public func bitxor(x: Uint48): Uint48 { Uint48(UintUtils.bitxor(_this, x.val(), UINT_48_MAX)) };
        public func bitnot(): Uint48 { Uint48(UintUtils.bitnot(_this, UINT_48_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint56(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_56_MAX);
        public func neg(): Uint56 { Uint56(UintUtils.neg(_this, UINT_56_MAX)) };
        public func add(x: Uint56): Uint56 { Uint56(UintUtils.add(_this, x.val(), UINT_56_MAX)) };
        public func sub(x: Uint56): Uint56 { Uint56(UintUtils.sub(_this, x.val(), UINT_56_MAX)) };
        public func mul(x: Uint56): Uint56 { Uint56(UintUtils.mul(_this, x.val(), UINT_56_MAX)) };
        public func div(x: Uint56): Uint56 { Uint56(UintUtils.div(_this, x.val(), UINT_56_MAX)) };
        public func rem(x: Uint56): Uint56 { Uint56(UintUtils.rem(_this, x.val(), UINT_56_MAX)) };
        public func pow(x: Nat): Uint56 { Uint56(UintUtils.pow(_this, x, UINT_56_MAX)) };
        public func bitshiftLeft(x: Nat): Uint56 { Uint56(UintUtils.bitshiftLeft(_this, x, UINT_56_MAX)) };
        public func bitshiftRight(x: Nat): Uint56 { Uint56(UintUtils.bitshiftRight(_this, x, UINT_56_MAX)) };
        public func bitand(x: Uint56): Uint56 { Uint56(UintUtils.bitand(_this, x.val(), UINT_56_MAX)) };
        public func bitor(x: Uint56): Uint56 { Uint56(UintUtils.bitor(_this, x.val(), UINT_56_MAX)) };
        public func bitxor(x: Uint56): Uint56 { Uint56(UintUtils.bitxor(_this, x.val(), UINT_56_MAX)) };
        public func bitnot(): Uint56 { Uint56(UintUtils.bitnot(_this, UINT_56_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint64(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_64_MAX);
        public func neg(): Uint64 { Uint64(UintUtils.neg(_this, UINT_64_MAX)) };
        public func add(x: Uint64): Uint64 { Uint64(UintUtils.add(_this, x.val(), UINT_64_MAX)) };
        public func sub(x: Uint64): Uint64 { Uint64(UintUtils.sub(_this, x.val(), UINT_64_MAX)) };
        public func mul(x: Uint64): Uint64 { Uint64(UintUtils.mul(_this, x.val(), UINT_64_MAX)) };
        public func div(x: Uint64): Uint64 { Uint64(UintUtils.div(_this, x.val(), UINT_64_MAX)) };
        public func rem(x: Uint64): Uint64 { Uint64(UintUtils.rem(_this, x.val(), UINT_64_MAX)) };
        public func pow(x: Nat): Uint64 { Uint64(UintUtils.pow(_this, x, UINT_64_MAX)) };
        public func bitshiftLeft(x: Nat): Uint64 { Uint64(UintUtils.bitshiftLeft(_this, x, UINT_64_MAX)) };
        public func bitshiftRight(x: Nat): Uint64 { Uint64(UintUtils.bitshiftRight(_this, x, UINT_64_MAX)) };
        public func bitand(x: Uint64): Uint64 { Uint64(UintUtils.bitand(_this, x.val(), UINT_64_MAX)) };
        public func bitor(x: Uint64): Uint64 { Uint64(UintUtils.bitor(_this, x.val(), UINT_64_MAX)) };
        public func bitxor(x: Uint64): Uint64 { Uint64(UintUtils.bitxor(_this, x.val(), UINT_64_MAX)) };
        public func bitnot(): Uint64 { Uint64(UintUtils.bitnot(_this, UINT_64_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint80(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_80_MAX);
        public func neg(): Uint80 { Uint80(UintUtils.neg(_this, UINT_80_MAX)) };
        public func add(x: Uint80): Uint80 { Uint80(UintUtils.add(_this, x.val(), UINT_80_MAX)) };
        public func sub(x: Uint80): Uint80 { Uint80(UintUtils.sub(_this, x.val(), UINT_80_MAX)) };
        public func mul(x: Uint80): Uint80 { Uint80(UintUtils.mul(_this, x.val(), UINT_80_MAX)) };
        public func div(x: Uint80): Uint80 { Uint80(UintUtils.div(_this, x.val(), UINT_80_MAX)) };
        public func rem(x: Uint80): Uint80 { Uint80(UintUtils.rem(_this, x.val(), UINT_80_MAX)) };
        public func pow(x: Nat): Uint80 { Uint80(UintUtils.pow(_this, x, UINT_80_MAX)) };
        public func bitshiftLeft(x: Nat): Uint80 { Uint80(UintUtils.bitshiftLeft(_this, x, UINT_80_MAX)) };
        public func bitshiftRight(x: Nat): Uint80 { Uint80(UintUtils.bitshiftRight(_this, x, UINT_80_MAX)) };
        public func bitand(x: Uint80): Uint80 { Uint80(UintUtils.bitand(_this, x.val(), UINT_80_MAX)) };
        public func bitor(x: Uint80): Uint80 { Uint80(UintUtils.bitor(_this, x.val(), UINT_80_MAX)) };
        public func bitxor(x: Uint80): Uint80 { Uint80(UintUtils.bitxor(_this, x.val(), UINT_80_MAX)) };
        public func bitnot(): Uint80 { Uint80(UintUtils.bitnot(_this, UINT_80_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint96(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_96_MAX);
        public func neg(): Uint96 { Uint96(UintUtils.neg(_this, UINT_96_MAX)) };
        public func add(x: Uint96): Uint96 { Uint96(UintUtils.add(_this, x.val(), UINT_96_MAX)) };
        public func sub(x: Uint96): Uint96 { Uint96(UintUtils.sub(_this, x.val(), UINT_96_MAX)) };
        public func mul(x: Uint96): Uint96 { Uint96(UintUtils.mul(_this, x.val(), UINT_96_MAX)) };
        public func div(x: Uint96): Uint96 { Uint96(UintUtils.div(_this, x.val(), UINT_96_MAX)) };
        public func rem(x: Uint96): Uint96 { Uint96(UintUtils.rem(_this, x.val(), UINT_96_MAX)) };
        public func pow(x: Nat): Uint96 { Uint96(UintUtils.pow(_this, x, UINT_96_MAX)) };
        public func bitshiftLeft(x: Nat): Uint96 { Uint96(UintUtils.bitshiftLeft(_this, x, UINT_96_MAX)) };
        public func bitshiftRight(x: Nat): Uint96 { Uint96(UintUtils.bitshiftRight(_this, x, UINT_96_MAX)) };
        public func bitand(x: Uint96): Uint96 { Uint96(UintUtils.bitand(_this, x.val(), UINT_96_MAX)) };
        public func bitor(x: Uint96): Uint96 { Uint96(UintUtils.bitor(_this, x.val(), UINT_96_MAX)) };
        public func bitxor(x: Uint96): Uint96 { Uint96(UintUtils.bitxor(_this, x.val(), UINT_96_MAX)) };
        public func bitnot(): Uint96 { Uint96(UintUtils.bitnot(_this, UINT_96_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint112(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_112_MAX);
        public func neg(): Uint112 { Uint112(UintUtils.neg(_this, UINT_112_MAX)) };
        public func add(x: Uint112): Uint112 { Uint112(UintUtils.add(_this, x.val(), UINT_112_MAX)) };
        public func sub(x: Uint112): Uint112 { Uint112(UintUtils.sub(_this, x.val(), UINT_112_MAX)) };
        public func mul(x: Uint112): Uint112 { Uint112(UintUtils.mul(_this, x.val(), UINT_112_MAX)) };
        public func div(x: Uint112): Uint112 { Uint112(UintUtils.div(_this, x.val(), UINT_112_MAX)) };
        public func rem(x: Uint112): Uint112 { Uint112(UintUtils.rem(_this, x.val(), UINT_112_MAX)) };
        public func pow(x: Nat): Uint112 { Uint112(UintUtils.pow(_this, x, UINT_112_MAX)) };
        public func bitshiftLeft(x: Nat): Uint112 { Uint112(UintUtils.bitshiftLeft(_this, x, UINT_112_MAX)) };
        public func bitshiftRight(x: Nat): Uint112 { Uint112(UintUtils.bitshiftRight(_this, x, UINT_112_MAX)) };
        public func bitand(x: Uint112): Uint112 { Uint112(UintUtils.bitand(_this, x.val(), UINT_112_MAX)) };
        public func bitor(x: Uint112): Uint112 { Uint112(UintUtils.bitor(_this, x.val(), UINT_112_MAX)) };
        public func bitxor(x: Uint112): Uint112 { Uint112(UintUtils.bitxor(_this, x.val(), UINT_112_MAX)) };
        public func bitnot(): Uint112 { Uint112(UintUtils.bitnot(_this, UINT_112_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint128(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_128_MAX);
        public func neg(): Uint128 { Uint128(UintUtils.neg(_this, UINT_128_MAX)) };
        public func add(x: Uint128): Uint128 { Uint128(UintUtils.add(_this, x.val(), UINT_128_MAX)) };
        public func sub(x: Uint128): Uint128 { Uint128(UintUtils.sub(_this, x.val(), UINT_128_MAX)) };
        public func mul(x: Uint128): Uint128 { Uint128(UintUtils.mul(_this, x.val(), UINT_128_MAX)) };
        public func div(x: Uint128): Uint128 { Uint128(UintUtils.div(_this, x.val(), UINT_128_MAX)) };
        public func rem(x: Uint128): Uint128 { Uint128(UintUtils.rem(_this, x.val(), UINT_128_MAX)) };
        public func pow(x: Nat): Uint128 { Uint128(UintUtils.pow(_this, x, UINT_128_MAX)) };
        public func bitshiftLeft(x: Nat): Uint128 { Uint128(UintUtils.bitshiftLeft(_this, x, UINT_128_MAX)) };
        public func bitshiftRight(x: Nat): Uint128 { Uint128(UintUtils.bitshiftRight(_this, x, UINT_128_MAX)) };
        public func bitand(x: Uint128): Uint128 { Uint128(UintUtils.bitand(_this, x.val(), UINT_128_MAX)) };
        public func bitor(x: Uint128): Uint128 { Uint128(UintUtils.bitor(_this, x.val(), UINT_128_MAX)) };
        public func bitxor(x: Uint128): Uint128 { Uint128(UintUtils.bitxor(_this, x.val(), UINT_128_MAX)) };
        public func bitnot(): Uint128 { Uint128(UintUtils.bitnot(_this, UINT_128_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint144(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_144_MAX);
        public func neg(): Uint144 { Uint144(UintUtils.neg(_this, UINT_144_MAX)) };
        public func add(x: Uint144): Uint144 { Uint144(UintUtils.add(_this, x.val(), UINT_144_MAX)) };
        public func sub(x: Uint144): Uint144 { Uint144(UintUtils.sub(_this, x.val(), UINT_144_MAX)) };
        public func mul(x: Uint144): Uint144 { Uint144(UintUtils.mul(_this, x.val(), UINT_144_MAX)) };
        public func div(x: Uint144): Uint144 { Uint144(UintUtils.div(_this, x.val(), UINT_144_MAX)) };
        public func rem(x: Uint144): Uint144 { Uint144(UintUtils.rem(_this, x.val(), UINT_144_MAX)) };
        public func pow(x: Nat): Uint144 { Uint144(UintUtils.pow(_this, x, UINT_144_MAX)) };
        public func bitshiftLeft(x: Nat): Uint144 { Uint144(UintUtils.bitshiftLeft(_this, x, UINT_144_MAX)) };
        public func bitshiftRight(x: Nat): Uint144 { Uint144(UintUtils.bitshiftRight(_this, x, UINT_144_MAX)) };
        public func bitand(x: Uint144): Uint144 { Uint144(UintUtils.bitand(_this, x.val(), UINT_144_MAX)) };
        public func bitor(x: Uint144): Uint144 { Uint144(UintUtils.bitor(_this, x.val(), UINT_144_MAX)) };
        public func bitxor(x: Uint144): Uint144 { Uint144(UintUtils.bitxor(_this, x.val(), UINT_144_MAX)) };
        public func bitnot(): Uint144 { Uint144(UintUtils.bitnot(_this, UINT_144_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint160(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_160_MAX);
        public func neg(): Uint160 { Uint160(UintUtils.neg(_this, UINT_160_MAX)) };
        public func add(x: Uint160): Uint160 { Uint160(UintUtils.add(_this, x.val(), UINT_160_MAX)) };
        public func sub(x: Uint160): Uint160 { Uint160(UintUtils.sub(_this, x.val(), UINT_160_MAX)) };
        public func mul(x: Uint160): Uint160 { Uint160(UintUtils.mul(_this, x.val(), UINT_160_MAX)) };
        public func div(x: Uint160): Uint160 { Uint160(UintUtils.div(_this, x.val(), UINT_160_MAX)) };
        public func rem(x: Uint160): Uint160 { Uint160(UintUtils.rem(_this, x.val(), UINT_160_MAX)) };
        public func pow(x: Nat): Uint160 { Uint160(UintUtils.pow(_this, x, UINT_160_MAX)) };
        public func bitshiftLeft(x: Nat): Uint160 { Uint160(UintUtils.bitshiftLeft(_this, x, UINT_160_MAX)) };
        public func bitshiftRight(x: Nat): Uint160 { Uint160(UintUtils.bitshiftRight(_this, x, UINT_160_MAX)) };
        public func bitand(x: Uint160): Uint160 { Uint160(UintUtils.bitand(_this, x.val(), UINT_160_MAX)) };
        public func bitor(x: Uint160): Uint160 { Uint160(UintUtils.bitor(_this, x.val(), UINT_160_MAX)) };
        public func bitxor(x: Uint160): Uint160 { Uint160(UintUtils.bitxor(_this, x.val(), UINT_160_MAX)) };
        public func bitnot(): Uint160 { Uint160(UintUtils.bitnot(_this, UINT_160_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint176(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_176_MAX);
        public func neg(): Uint176 { Uint176(UintUtils.neg(_this, UINT_176_MAX)) };
        public func add(x: Uint176): Uint176 { Uint176(UintUtils.add(_this, x.val(), UINT_176_MAX)) };
        public func sub(x: Uint176): Uint176 { Uint176(UintUtils.sub(_this, x.val(), UINT_176_MAX)) };
        public func mul(x: Uint176): Uint176 { Uint176(UintUtils.mul(_this, x.val(), UINT_176_MAX)) };
        public func div(x: Uint176): Uint176 { Uint176(UintUtils.div(_this, x.val(), UINT_176_MAX)) };
        public func rem(x: Uint176): Uint176 { Uint176(UintUtils.rem(_this, x.val(), UINT_176_MAX)) };
        public func pow(x: Nat): Uint176 { Uint176(UintUtils.pow(_this, x, UINT_176_MAX)) };
        public func bitshiftLeft(x: Nat): Uint176 { Uint176(UintUtils.bitshiftLeft(_this, x, UINT_176_MAX)) };
        public func bitshiftRight(x: Nat): Uint176 { Uint176(UintUtils.bitshiftRight(_this, x, UINT_176_MAX)) };
        public func bitand(x: Uint176): Uint176 { Uint176(UintUtils.bitand(_this, x.val(), UINT_176_MAX)) };
        public func bitor(x: Uint176): Uint176 { Uint176(UintUtils.bitor(_this, x.val(), UINT_176_MAX)) };
        public func bitxor(x: Uint176): Uint176 { Uint176(UintUtils.bitxor(_this, x.val(), UINT_176_MAX)) };
        public func bitnot(): Uint176 { Uint176(UintUtils.bitnot(_this, UINT_176_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint192(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_192_MAX);
        public func neg(): Uint192 { Uint192(UintUtils.neg(_this, UINT_192_MAX)) };
        public func add(x: Uint192): Uint192 { Uint192(UintUtils.add(_this, x.val(), UINT_192_MAX)) };
        public func sub(x: Uint192): Uint192 { Uint192(UintUtils.sub(_this, x.val(), UINT_192_MAX)) };
        public func mul(x: Uint192): Uint192 { Uint192(UintUtils.mul(_this, x.val(), UINT_192_MAX)) };
        public func div(x: Uint192): Uint192 { Uint192(UintUtils.div(_this, x.val(), UINT_192_MAX)) };
        public func rem(x: Uint192): Uint192 { Uint192(UintUtils.rem(_this, x.val(), UINT_192_MAX)) };
        public func pow(x: Nat): Uint192 { Uint192(UintUtils.pow(_this, x, UINT_192_MAX)) };
        public func bitshiftLeft(x: Nat): Uint192 { Uint192(UintUtils.bitshiftLeft(_this, x, UINT_192_MAX)) };
        public func bitshiftRight(x: Nat): Uint192 { Uint192(UintUtils.bitshiftRight(_this, x, UINT_192_MAX)) };
        public func bitand(x: Uint192): Uint192 { Uint192(UintUtils.bitand(_this, x.val(), UINT_192_MAX)) };
        public func bitor(x: Uint192): Uint192 { Uint192(UintUtils.bitor(_this, x.val(), UINT_192_MAX)) };
        public func bitxor(x: Uint192): Uint192 { Uint192(UintUtils.bitxor(_this, x.val(), UINT_192_MAX)) };
        public func bitnot(): Uint192 { Uint192(UintUtils.bitnot(_this, UINT_192_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint224(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_224_MAX);
        public func neg(): Uint224 { Uint224(UintUtils.neg(_this, UINT_224_MAX)) };
        public func add(x: Uint224): Uint224 { Uint224(UintUtils.add(_this, x.val(), UINT_224_MAX)) };
        public func sub(x: Uint224): Uint224 { Uint224(UintUtils.sub(_this, x.val(), UINT_224_MAX)) };
        public func mul(x: Uint224): Uint224 { Uint224(UintUtils.mul(_this, x.val(), UINT_224_MAX)) };
        public func div(x: Uint224): Uint224 { Uint224(UintUtils.div(_this, x.val(), UINT_224_MAX)) };
        public func rem(x: Uint224): Uint224 { Uint224(UintUtils.rem(_this, x.val(), UINT_224_MAX)) };
        public func pow(x: Nat): Uint224 { Uint224(UintUtils.pow(_this, x, UINT_224_MAX)) };
        public func bitshiftLeft(x: Nat): Uint224 { Uint224(UintUtils.bitshiftLeft(_this, x, UINT_224_MAX)) };
        public func bitshiftRight(x: Nat): Uint224 { Uint224(UintUtils.bitshiftRight(_this, x, UINT_224_MAX)) };
        public func bitand(x: Uint224): Uint224 { Uint224(UintUtils.bitand(_this, x.val(), UINT_224_MAX)) };
        public func bitor(x: Uint224): Uint224 { Uint224(UintUtils.bitor(_this, x.val(), UINT_224_MAX)) };
        public func bitxor(x: Uint224): Uint224 { Uint224(UintUtils.bitxor(_this, x.val(), UINT_224_MAX)) };
        public func bitnot(): Uint224 { Uint224(UintUtils.bitnot(_this, UINT_224_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint256(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_256_MAX);
        public func neg(): Uint256 { Uint256(UintUtils.neg(_this, UINT_256_MAX)) };
        public func add(x: Uint256): Uint256 { Uint256(UintUtils.add(_this, x.val(), UINT_256_MAX)) };
        public func sub(x: Uint256): Uint256 { Uint256(UintUtils.sub(_this, x.val(), UINT_256_MAX)) };
        public func mul(x: Uint256): Uint256 { Uint256(UintUtils.mul(_this, x.val(), UINT_256_MAX)) };
        public func div(x: Uint256): Uint256 { Uint256(UintUtils.div(_this, x.val(), UINT_256_MAX)) };
        public func rem(x: Uint256): Uint256 { Uint256(UintUtils.rem(_this, x.val(), UINT_256_MAX)) };
        public func pow(x: Nat): Uint256 { Uint256(UintUtils.pow(_this, x, UINT_256_MAX)) };
        public func bitshiftLeft(x: Nat): Uint256 { Uint256(UintUtils.bitshiftLeft(_this, x, UINT_256_MAX)) };
        public func bitshiftRight(x: Nat): Uint256 { Uint256(UintUtils.bitshiftRight(_this, x, UINT_256_MAX)) };
        public func bitand(x: Uint256): Uint256 { Uint256(UintUtils.bitand(_this, x.val(), UINT_256_MAX)) };
        public func bitor(x: Uint256): Uint256 { Uint256(UintUtils.bitor(_this, x.val(), UINT_256_MAX)) };
        public func bitxor(x: Uint256): Uint256 { Uint256(UintUtils.bitxor(_this, x.val(), UINT_256_MAX)) };
        public func bitnot(): Uint256 { Uint256(UintUtils.bitnot(_this, UINT_256_MAX)) };
        public func val(): Nat { _this };
    };


    public class Uint512(v: Nat) = this {
        private var _this: Nat = _assert(v, UINT_512_MAX);
        public func neg(): Uint512 { Uint512(UintUtils.neg(_this, UINT_512_MAX)) };
        public func add(x: Uint512): Uint512 { Uint512(UintUtils.add(_this, x.val(), UINT_512_MAX)) };
        public func sub(x: Uint512): Uint512 { Uint512(UintUtils.sub(_this, x.val(), UINT_512_MAX)) };
        public func mul(x: Uint512): Uint512 { Uint512(UintUtils.mul(_this, x.val(), UINT_512_MAX)) };
        public func div(x: Uint512): Uint512 { Uint512(UintUtils.div(_this, x.val(), UINT_512_MAX)) };
        public func rem(x: Uint512): Uint512 { Uint512(UintUtils.rem(_this, x.val(), UINT_512_MAX)) };
        public func pow(x: Nat): Uint512 { Uint512(UintUtils.pow(_this, x, UINT_512_MAX)) };
        public func bitshiftLeft(x: Nat): Uint512 { Uint512(UintUtils.bitshiftLeft(_this, x, UINT_512_MAX)) };
        public func bitshiftRight(x: Nat): Uint512 { Uint512(UintUtils.bitshiftRight(_this, x, UINT_512_MAX)) };
        public func bitand(x: Uint512): Uint512 { Uint512(UintUtils.bitand(_this, x.val(), UINT_512_MAX)) };
        public func bitor(x: Uint512): Uint512 { Uint512(UintUtils.bitor(_this, x.val(), UINT_512_MAX)) };
        public func bitxor(x: Uint512): Uint512 { Uint512(UintUtils.bitxor(_this, x.val(), UINT_512_MAX)) };
        public func bitnot(): Uint512 { Uint512(UintUtils.bitnot(_this, UINT_512_MAX)) };
        public func val(): Nat { _this };
    };
    
}