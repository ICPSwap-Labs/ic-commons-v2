import Error "mo:base/Error";

module {

    public func isTrue(expression: Bool, message: Text): async () {
        if (not expression) {
            throw Error.reject(message);
        };
    }

}