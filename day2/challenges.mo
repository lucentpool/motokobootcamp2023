import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

actor {

    // 1. Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
    public func average_array(array : [Int]) : async Int {
        var sum : Int =0;

        for(i in array.vals()){
            sum += i;
        };
        return sum / array.size();
    };

    // 2. Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
    public func char_count(string : Text, char : Char) : async Int {
        var count  : Nat =0;

        for(i in string.chars()){
            if( i == char){
                count += 1;
            };
        };
        return count;
    };

    // 3. Write a function factorial that takes a natural number n and returns the factorial of n.
    public query func factorial(n : Nat) : async Nat {
        var fact : Nat =1;

        for(i in Iter.range(1, n)){
            fact *= 1;
        };
        return fact;   
    };

    // 4.Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
    public query func number_of_words(sentence : Text) : async Nat {
        let split = Text.split(sentence, #char ' ');
        let words = Iter.toArray<Text>(split);
        return words.size();
    };

    // 5.Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.

    public query func find_duplicates(array : [Nat]) : async [Nat] {
        let array_length = array.size();
        var duplicates_nums : [Nat] =[];
        
        for(i in Iter.range(0, array_length-1)) {
            for(j in Iter.range(i+1, array_length-1)) {
                if(array[i] == array[j]){
                let existing: ?Nat = Array.find<Nat>(duplicates_nums, func (x : Nat):Bool {x == array[i]});

                switch (existing) {
                    case (null) {
                        duplicates_nums:= Array.append<Nat>(duplicates_nums,[array[i]])
                    };
                    case(?_){                      
                    };
                };
                };
            };
        };
        return duplicates_nums;
    };

    // 6.Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
    public query func convert_to_binary(n : Nat) : async Text {
        var num: Nat = n;
        var binary : Text = Nat.toText(num % 2);

        while(num > 1){
            num := (num / 2);
            binary :=  Nat.toText(num % 2) # (binary);
        };
        return binary;
    };

};
