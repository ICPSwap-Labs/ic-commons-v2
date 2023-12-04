import Bool "mo:base/Bool";

module {
    public func ternary<T>(expression: Bool, t: T, f: T): T {
        if (expression) {
            return t;
        } else {
            return  f;
        };
    };
}