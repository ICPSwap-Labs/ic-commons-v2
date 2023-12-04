import Option "mo:base/Option";
import Int "mo:base/Int";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Bool "mo:base/Bool";
import Nat "mo:base/Nat";
import Nat64 "mo:base/Nat64";
import Int64 "mo:base/Int64";
import Int32 "mo:base/Int32";
import Order "mo:base/Order";

module {
    type Node<T> = {
        item: T;
        var prev: ?Node<T>;
        var next: ?Node<T>;
    };
    public class SortedStack<T>(equal: (T, T) -> Bool, compare: (T, T) -> Order.Order) {
        private var _first: ?Node<T> = null;
        private var _last: ?Node<T> = _first;
        private var _size: Nat = 0;
        private var _compare: (T, T) -> Order.Order = compare;
        private var _equal: (T, T) -> Bool = equal;
        
        // private var indexs: [var Index<T>] = [];
        func _add(item: T) {
            if (Option.isNull(_first)) {
                 _first := Option.make({
                    item = item;
                    var prev = null;
                    var next = null;
                }: Node<T>);
            } else {
                _loop(func (curr: Node<T>, index: Nat): Bool {
                    switch (_compare(item, curr.item)) {
                        case (#less) {
                            var node = {
                                item = item;
                                var prev = null;
                                var next = null;
                            }: Node<T>;
                            var opt: ?Node<T> = Option.make(node);
                            switch (curr.prev) {
                                case (?prev) {
                                    prev.next := Option.make({
                                        item = item;
                                        var prev = curr.prev;
                                        var next = Option.make(curr);
                                    }: Node<T>);
                                    curr.prev := prev.next;
                                };
                                case (_) {
                                    curr.prev := Option.make({
                                        item = item;
                                        var prev = null;
                                        var next = Option.make(curr);
                                    }: Node<T>);
                                    _first := curr.prev;
                                };
                            };
                            return false;
                        };
                        case (_) {
                            switch (curr.next) {
                                case (?next) {
                                    return true;
                                };
                                case (_) {
                                    curr.next := Option.make({
                                        item = item;
                                        var prev = Option.make(curr);
                                        var next = null;
                                    }: Node<T>);
                                    return false;
                                };
                            }
                        };
                    };
                    // if (_comparator(e, curr) < 0) {
                    //     var node = {
                    //         item = item;
                    //         var prev = null;
                    //         var next = null;
                    //     }: Node<T>;
                    //     var opt: ?Node<T> = Option.make(node);
                    //     switch (curr.prev) {
                    //         case (?prev) {
                    //             prev.next := Option.make({
                    //                 item = item;
                    //                 var prev = curr.prev;
                    //                 var next = Option.make(curr);
                    //             }: Node<T>);
                    //             curr.prev := prev.next;
                    //         };
                    //         case (_) {
                    //             curr.prev := Option.make({
                    //                 item = item;
                    //                 var prev = null;
                    //                 var next = Option.make(curr);
                    //             }: Node<T>);
                    //             _first := curr.prev;
                    //         };
                    //     };
                    //     return false;
                    // } else {
                    //     switch (curr.next) {
                    //         case (?next) {
                    //             return true;
                    //         };
                    //         case (_) {
                    //             curr.next := Option.make({
                    //                 item = item;
                    //                 var prev = Option.make(curr);
                    //                 var next = null;
                    //             }: Node<T>);
                    //             return false;
                    //         };
                    //     }
                    // };
                });
            };
            _size := _size + 1;
        };
        func _toBuffer(): Buffer.Buffer<T> {
            var buffer: Buffer.Buffer<T> = Buffer.Buffer<T>(_size);
            _loop(func (curr, index) {
                buffer.add(curr.item);
                return switch (curr.next) {case (?next) { true }; case (_) { false };}
            });
            return buffer;
        };
        func _loop(fun: (curr: Node<T>, index: Nat) -> Bool) {
            var curr: ?Node<T> = _first;
            var isContinue: Bool = true;
            var index: Nat = 0;
            while (Option.isSome(curr) and isContinue) {
                switch (curr) {
                    case (?node) {
                        isContinue := fun(node, index);
                        curr := node.next;
                    };
                    case (_) {
                        isContinue := false;
                    };
                };
                index := index + 1;
            };
        };
        func _delete(item: Node<T>) {
            if (Option.isNull(item.prev) and Option.isNull(item.next)) { 
                _first := null;
            } else if (Option.isNull(item.prev)) {
                var node: ?Node<T> = item.next;
                switch (node) { case (?no) { no.prev := null; }; case (_) {}; };
                _first := node;
            } else {
                switch (item.prev) { case (?prev) {prev.next := item.next;}; case (_) {}; };
                switch (item.next) { case (?next) {next.prev := item.prev;}; case (_) {}; };
            };
            _size := _size - 1;
        };
        public func size(): Nat {
            return _size;
        };
        public func add(item: T) {
            _add(item);
        };
        public func poll(): ?T{
            switch (_first) {
                case (?node) {
                    _first := node.next;
                    switch (node.next) { case (?next) {next.prev := null;}; case (_) {}; };
                    _size := _size - 1;
                    return Option.make(node.item);
                };
                case (_) {
                    return null;
                };
            };
        };
        public func peek(): ?T { 
            switch (_first) {
                case (?node) {
                    return Option.make(node.item);
                };
                case (_) {
                    return null;
                };
            };
        };
        public func remove() {
            ignore poll();
        };
        public func contains(e: T): Bool {
            var contains: Bool = false;
            _loop(func (node: Node<T>, i: Nat) {
                if (_equal(node.item, e)) {
                    contains := true;
                    return false;
                } else {
                    return true;
                };
            });
            return contains;
        };
        
        public func each(fun: (item: T, index: Nat) -> Bool) {
            _loop(func (curr: Node<T>, index: Nat) {
                return fun(curr.item, index);
            });
        };
        public func filter(fun: (item: T) -> Bool): SortedStack<T> {
            var queue: SortedStack<T> = SortedStack<T>(_equal, _compare);
            _loop(func (node, index): Bool {
                if (fun(node.item)) {
                    queue.add(node.item);
                };
                return true;
            });
            return queue;
        };
        public func toArray(): [T] {
            return Buffer.toArray(_toBuffer());
        };
        public func toVarArray(): [var T] {
            return Buffer.toVarArray(_toBuffer());
        };
    };
}