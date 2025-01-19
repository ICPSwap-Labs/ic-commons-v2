import Principal "mo:base/Principal";
import IC0Utils "../src/utils/IC0Utils";
import Debug "mo:base/Debug";

actor TestIC0 {

    public func deposit_cycles(cid : Principal, amount : Nat) : async () {
        await IC0Utils.deposit_cycles(cid, amount);
    };

    public func canister_status(cid : Principal) : async IC0Utils.canister_status_result {
        await IC0Utils.canister_status(cid);
    };

    public func start_canister(cid : Principal) : async () {
        await IC0Utils.start_canister(cid);
    };

    public func stop_canister(cid : Principal) : async () {
        await IC0Utils.stop_canister(cid);
    };

    public func update_settings_add_controller(cid : Principal, controllers : [Principal]) : async () {
        await IC0Utils.update_settings_add_controller(cid, controllers);
    };

    public func update_settings_remove_controller(cid : Principal, controllers : [Principal]) : async () {
        await IC0Utils.update_settings_remove_controller(cid, controllers);
    };

    public func create_canister() : async Text {
        let result = await IC0Utils.create_canister(null, null, 1860000000000);
        let canister_id = result.canister_id;
        let status = await IC0Utils.canister_status(canister_id);
        Debug.print(debug_show(status));
        Principal.toText(canister_id);
    };

};
