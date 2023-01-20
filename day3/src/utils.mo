import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

module {

    // create a function called second_maximum that takes an array [Int] of integers and returns the second largest number in the array.
    public func second_maximum( array : [Int] ) : async Int {

        if (array.size() == 0){
            return 0;
        };

        if(array.size() > 1 ){
            let sorted = Array.sort(array, Int.compare);
            let array2 = Array.reverse(sorted);
            var n : Int =0;
            for(i in Iter.range(0, array2.size() - 2)){

                if( array2[i] != array2[i+1]){
                    n := array2[i+1];
                    return n;
                };
            };
            return array2[1];
        }
        else{
            return array[0];
        }
    };

    // create a function called remove_even that takes an array [Nat] and returns a new array with only the odd numbers from the original array.
    public func remove_event( array : [Nat] ) : async [Nat] {
        var odd : [Nat] =[];

        for(i in array.vals()){
            if(i%2 != 0 ){
               odd := Array.append(odd, [i]);
            };
        };

        return odd;
    };

    // write a function drop that takes 2 parameters: an array [T] and a Nat n. This function will drop the n first elements of the array and returns the remainder.
    public func drop<T>(array : [T], n : Nat ) : [T] {
        var remainder : [T] = [];

        if(array.size() < n){
            return [];
        };

        for(i in Iter.range(0, array.size() - 1)){
            remainder := Array.append(remainder, [array[i]]);
        };

        return remainder;
    };

}