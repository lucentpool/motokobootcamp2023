import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
actor {

    // 1. Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.

    func unique<T>(l : List.List<T>, equal : (m : T, n : ?T) -> Bool) : List.List<?T> {
        var res : List.List<?T> = null;
        var rud : List.List<T> = l;

            while(List.List.isNil(rud) == false){
                let (popped, result) = List.List.pop<T>(l);
                rud := result;

                if (List.List.find<T>(rud, func (e){equal(e, popped)}) == false){
                    res := List.List.push(popped, res);
                };
            };
            return res;
    };

    // 2. Write a function reverse that takes l of type List and returns the reversed list.
    func reverse<T>(l : List.List<T>) : List.List<T> {
        List.reverse<T>(l);
    };

    // 3. Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
    public shared ({caller}) func is_anynomous() : async Bool {
        Principal.isAnonymous(caller);
    };

    // 4. Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, and returns the optional index of the first occurrence of "val" in "buf".
    func find_in_buffer<T>(buf : Buffer.Buffer<T>, val : T, equal : (m : T,n : T) -> Bool) : ?Nat {
        return Buffer.indexOf<T>(val, buf, equal );
    };

    // 5. Take a look at the code we've seen before in this guide:
    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    public shared ({ caller }) func add_username(name : Text) : async () {
        usernames.put(caller, name);
    };

    // Add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.
    public func get_usernames() : async [(Principal,Text)] {
        return Iter.toArray(usernames.entries());

    };

};
