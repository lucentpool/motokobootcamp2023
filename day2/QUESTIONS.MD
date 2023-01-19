1. The ledger canister is controlled by a principal.
2. The subnet of the canister with the id **mwrha-maaaa-aaaab-qabqq-cai** is **pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe**. 16 nodes are running this subnet.
3. Expected voting power: Staked ICP Tokens * (1.06 + Disolve Bonus) * Age Bonus = 10 * 1.53 * 1.125 = 17.2125 
4. There has to be an import of the the Nat module ```import Nat "mo:base/Nat"```. The variables ```n``` and ```t``` are unused, so they could be omitted.
5. The variable ```language``` has to be immutable, so it should be ```let``` instead of ```var```.
6. There has to be an import of the the Array module ```import Array "mo:base/Array";```. Also if languages were to be immutable, that is had ```let``` instead of ```var```, then ```append``` would not work on it.
