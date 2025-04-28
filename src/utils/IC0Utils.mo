import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Cycles "mo:base/ExperimentalCycles";
import CollectionUtils "./CollectionUtils";

module {

    public type canister_settings = {
        controllers : ?[Principal];
        compute_allocation : ?Nat;
        memory_allocation : ?Nat;
        freezing_threshold : ?Nat;
        reserved_cycles_limit : ?Nat;
        // log_visibility : opt log_visibility;
        wasm_memory_limit : ?Nat;
    };
    public type definite_canister_settings = {
        controllers : [Principal];
        compute_allocation :  Nat;
        memory_allocation : Nat;
        freezing_threshold : Nat;
        reserved_cycles_limit : Nat;
        // log_visibility : log_visibility;
        wasm_memory_limit : Nat;
    };
    public type create_canister_args = {
        settings : ? canister_settings;
        sender_canister_version : ? Nat64;
    };
    public type create_canister_result = {
        canister_id : Principal;
    };
    public type update_settings_args = {
        canister_id : Principal;
        settings : canister_settings;
        sender_canister_version : ? Nat64;
    };
    public type start_canister_args = {
        canister_id : Principal;
    };
    public type stop_canister_args = {
        canister_id : Principal;
    };
    public type canister_status_args = {
        canister_id : Principal;
    };
    public type canister_status_result = {
        status : { #running; #stopping; #stopped };
        settings : definite_canister_settings;
        module_hash : ? Blob;
        memory_size : Nat;
        cycles : Nat;
        reserved_cycles : Nat;
        idle_cycles_burned_per_day : Nat;
        query_stats: {
            num_calls_total: Nat;
            num_instructions_total: Nat;
            request_payload_bytes_total: Nat;
            response_payload_bytes_total: Nat;
        };
    };
    public type canister_info_args = {
        canister_id : Principal;
        num_requested_changes : ? Nat64;
    };
    public type change_origin = {
        from_user : { user_id : Principal; };
        from_canister : {
            canister_id : Principal;
            canister_version : ? Nat64;
        };
    };
    public type change_details = {
        creation : { controllers : [Principal]; };
        // code_uninstall;
        code_deployment : {
            mode : { #install; #reinstall; #upgrade; };
            module_hash : Blob;
        };
        controllers_change : {
            controllers : [Principal];
        };
    };
    public type change = {
        timestamp_nanos : Nat64;
        canister_version : Nat64;
        origin : change_origin;
        details : change_details;
    };
    public type canister_info_result = {
        total_num_changes : Nat64;
        recent_changes : [change];
        module_hash : ? Blob;
        controllers : [Principal];
    };
    public type delete_canister_args = {
        canister_id : Principal;
    };
    public type deposit_cycles_args = {
        canister_id : Principal;
    };
    
    public type canister_install_mode = {
        #install;
        #reinstall;
        #upgrade : ? {
            skip_pre_upgrade : ? Bool;
            wasm_memory_persistence : ? {
                #keep;
                #replace;
            };
        };
    };

    public type install_code_args = {
        mode : canister_install_mode;
        canister_id : Principal;
        wasm_module : Blob;
        arg : Blob;
        sender_canister_version : ? Nat64;
    };

    let ic00 = actor "aaaaa-aa" : actor {
        create_canister : (create_canister_args) -> async (create_canister_result);
        update_settings : (update_settings_args) -> async ();
        start_canister : (start_canister_args) -> async ();
        stop_canister : (stop_canister_args) -> async ();
        canister_status : (canister_status_args) -> async (canister_status_result);
        canister_info : (canister_info_args) -> async (canister_info_result);
        delete_canister : (delete_canister_args) -> async ();
        deposit_cycles : (deposit_cycles_args) -> async ();
        install_code : (install_code_args) -> async ();
    };

    public func create_canister(settings : ? canister_settings, sender_canister_version : ? Nat64, amount : Nat) : async (create_canister_result) {
        Cycles.add<system>(amount);
        await ic00.create_canister({ settings = settings; sender_canister_version = sender_canister_version; });
    };

    public func update_settings_add_controller(cid : Principal, controllers : [Principal]) : async () {
        var result = await ic00.canister_status({ canister_id = cid });
        var settings = result.settings;
        var controllerList = List.append(List.fromArray(settings.controllers), List.fromArray(controllers));
        await ic00.update_settings({
            canister_id = cid; 
            settings = {
                controllers = ?List.toArray(controllerList);
                compute_allocation = null;
                memory_allocation = null;
                freezing_threshold = null;
                reserved_cycles_limit = null;
                wasm_memory_limit = null;
            };
            sender_canister_version = null;
        });
    };

    public func update_settings_remove_controller(cid : Principal, controllers : [Principal]) : async () {
        var result = await ic00.canister_status({ canister_id = cid });
        var settings = result.settings;
        let buffer: Buffer.Buffer<Principal> = Buffer.Buffer<Principal>(0);
        for (it in settings.controllers.vals()) {
            if (not CollectionUtils.arrayContains<Principal>(controllers, it, Principal.equal)) {
                buffer.add(it);
            };
        };
        await ic00.update_settings({
            canister_id = cid; 
            settings = {
                controllers = ?Buffer.toArray<Principal>(buffer);
                compute_allocation = null;
                memory_allocation = null;
                freezing_threshold = null;
                reserved_cycles_limit = null;
                wasm_memory_limit = null;
            };
            sender_canister_version = null;
        });
    };

    public func start_canister(cid : Principal) : async () {
        await ic00.start_canister({ canister_id = cid; });
    };

    public func stop_canister(cid : Principal) : async () {
        await ic00.stop_canister({ canister_id = cid; });
    };

    public func delete_canister(cid : Principal) : async () {
        await ic00.delete_canister({ canister_id = cid; });
    };

    public func deposit_cycles(cid : Principal, amount : Nat) : async () {
        Cycles.add<system>(amount);
        await ic00.deposit_cycles({ canister_id = cid; });
    };

    public func canister_status(cid : Principal) : async canister_status_result {
        await ic00.canister_status({ canister_id = cid });
    };

    public func installCode(canisterId : Principal, arg : Blob, wasmModule : Blob, mode : canister_install_mode) : async () {
        await ic00.install_code({
            arg = arg;
            wasm_module = wasmModule;
            mode = mode;
            canister_id = canisterId;
            sender_canister_version = null;
        });
    };

    public func getControllers(cid : Principal) : async [Principal] {
        let status = await ic00.canister_status({ canister_id = cid });
        return status.settings.controllers;
    };
};
