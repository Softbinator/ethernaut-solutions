# Logic

To avoid a self-proclamation we need to breake the receive function. This function can revert in 2 ways:
* required 
* external call

As we can see, the require will never reverts for the owner of the contract, and this is how it will try the self-proclamation. 

The other way is to brake the externall call. To revert it, we created a contract that can't receive ether, and to to that we don't create a fallback and receive function.

# Solution
Check `KingAttack.sol`
