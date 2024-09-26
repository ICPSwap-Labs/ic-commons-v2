import Principal "mo:base/Principal";
import IC0Utils "../src/utils/IC0Utils";

actor TestIC0 {

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

};
