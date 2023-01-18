1. How much is the current memory capacity of a canister?


   The current memory capacity of a canister is 4 GB.

2. What is the issue with the following code sample?
    ```
    actor {
    let counter : Nat = 0;
    public func increment_counter() : async () {
        counter := counter + 1;
    };
    }
    ```

   ```counter``` should be declared as ```var``` instead of ```let```. Because the ```increment_counter``` function mutates ```counter```, but the ```let``` keyword declares ```counter``` as immutable.

3. What is the issue with the following code sample?
    ```
    actor {
    var message : Text = 0;

    public query func change_message(new_message : Text) : async () {
        message := new_message;
        return;
    };
    
    public query func see_message() : async Text {
        return(message);
    };
    }
    ```
   Variables of the type Text have to be wrapped in double quotes, so it should be "0".
   The  ```change_message``` function has the ```query``` keyword, so if the message should really be changed, then ```query``` should be removed. Also the return in ```change_message``` is not required.

4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.
   
   False. The ```async``` keyword can not be removed for a query function.