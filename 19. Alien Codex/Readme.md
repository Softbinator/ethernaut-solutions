# Logic

As we can see, there is no way to alter the owner in a direct way by us. But on a first view, we can see that we have a dynamic array in our storage. 

How actually the storage works?
Firstly, we can say that the variable `_owner` is in slot 0, so somehow we need to access that slot and modify it. Now back to our dynamic array and hot does it work in storage. 

Dynamic array storage layout can be found at: https://docs.soliditylang.org/en/v0.8.17/internals/layout_in_storage.html#mappings-and-dynamic-arrays

So, after reading the documentation, we can access the length of the array at slot 1 and the first value is at slot `keccak(1)`. Another fact about storage is that it has 2**256-1 slots. And our array is dynamic(it can as long as we want)

# Solution
Firstly, to call any function from the contract we have to call `make_contact`. After this, we cand use the **underflow** vulnerability in the `retract()` function and make the length of the array `0 - 1 = 2**256`. After this, using the `revise()` function, we can overide some slots. 

For overriding **slot 0** we will use now the overflow vulnerability in slots.
```
 --------------------------------------------------------------
 slot       -> values
 --------------------------------------------------------------
| 0         -> owner + conected                                |
| 1         -> codex.length                                    |
| .............................................................|
| .............................................................|
| keccak(1) -> codex[0]                                        |
| keccak(2) -> codex[1]                                        |
| .............................................................|
| .............................................................|
| 2**256      -> codex[2**256 - 1 - keccak(1)]                 |
| 0           -> codex[2**256 - 1 - keccak(1) + 1]             |
 --------------------------------------------------------------
```

After finding the index, we call `revise()` with the index that we found and our address.

You can solve this exercise in the game console or by creating a contract. For the second option you can find the solution at `AlienCodexAttack.sol`
