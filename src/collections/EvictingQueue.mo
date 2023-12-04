import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Debug "mo:base/Debug";

module {
    public class EvictingQueue<T>(queueSize: Nat, equal: (T, T) -> Bool) {
        private var _array: [var ?T] = Array.tabulateVar<?T>(queueSize, func (ind: Nat): ?T { return null; });
        private var _maxSize: Nat = queueSize;
        private var _startIndex: Nat = 0;
        private var _size: Nat = 0;
        private var _equal: (T, T) -> Bool = equal;
        func _nextIndex(): (Nat, Nat) {
            let index = _startIndex + _size;
            if (index >= _maxSize) {
                var startIndex = if (_size == _maxSize) { _startIndex + 1 } else { _startIndex };
                if (startIndex >= _maxSize) {
                    startIndex := startIndex % _maxSize;
                };
                return (startIndex, index % _maxSize)
            } else {
                return (_startIndex, index);
            };
        };
        func _currIndex(): Nat {
            let index = Nat.sub(_startIndex + _size, 1);
            if (index >= _maxSize) {
                return index % _maxSize;
            };
            return index;
        };
        func _loop(fun: (e: T, index: Nat) -> Bool) {
            if (_size > 0) {
                var offset: Nat = 0;
                var isContinue: Bool = true;
                while (offset < _size and isContinue) {
                    var index: Nat = _startIndex + offset;
                    if (index >= _maxSize) {
                        index := Nat.sub(index, _maxSize);
                    };
                    switch (_array[index]) {
                        case (?e) {
                            isContinue := fun(e, offset);
                        };
                        case (_) {
                            isContinue := false;
                        };
                    };
                    offset := offset + 1;
                };
            };
        };
        func _toBuffer(): Buffer.Buffer<T> {
            var buffer: Buffer.Buffer<T> = Buffer.Buffer<T>(_size);
            _loop(func (e: T, i: Nat): Bool { 
                buffer.add(e); 
                return true;
            });
            return buffer;
        };
        public func add(el: T): Bool {
            let (startIndex, nextIndex) = _nextIndex();
            _array[nextIndex] := Option.make(el);
            _startIndex := startIndex;
            _size := if (_size >= _maxSize) { _maxSize } else { _size + 1 };
            return true;
        };
        public func contains(el: T): Bool {
            var contains: Bool = false;
            _loop(func (e: T, i: Nat) {
                if (_equal(el, e)) {
                    contains := true;
                    return false;
                } else {
                    return true;
                };
            });
            return contains;
        };
        public func remove() {
            ignore poll();
        };
        public func poll(): ?T {
            if (_size > 0) {
                let index = _currIndex();
                var ret: ?T = _array[index];
                _array[index] := null;
                _size := _size - 1;
                return ret;
            } else {
                return null;
            };
        };
        public func peek(): ?T {
            if (_size > 0) {
                return _array[_currIndex()];
            } else {
                return null;
            };
        };
        
        public func toArray(): [T] {
            Buffer.toArray(_toBuffer());
        };
        public func toVarArray(): [var T] {
            Buffer.toVarArray(_toBuffer());
        };
        public func size(): Nat {
            return _size;
        };
    };
};