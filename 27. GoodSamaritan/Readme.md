# Logic

That `notify` function seems weir. This is the hint for you to solve the challenge

# Solution
We can observe 2 weird behaviours, first is the `try catch` block and the second is the `notify` call to an external contract. 

If you put both side by side we can see that if we send the transaction from a contract that implements `INotifyable`, we can throw a fake error and than it will enter in the `catch` block and trigger the `transferRemainder` with all the funds.

A small attention here, your `notify` function should throw an error only if the amount is 0 or at first call, because `transferRemainder` also call `transfer` function.

You cand find **our solution** at `GoodSamaritanAttack.sol`. 

Just call the `attack` function with the address of the deployed `GoodSamaritan` contract.
