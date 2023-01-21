1. Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?
No, the heap memory is not saved when upgrading a canister. A canister has 4 GiB of heap memory.

2. How much accounts can a unique Principal own?
A unique Principal can own 2<sup>32</sup> = 4,294,967,296 accounts.

3. Can we safely upgrade a canister from interface A to interface B?
No, if it is the intention to have interface B use the first name with ```firstname```. Because ```firstname``` will be given the first parameter ```surname``` of interface B, and the second parameter of interface B, ```firstname``` will be ignored.
