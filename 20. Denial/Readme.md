# Logic 
We can see that the `withdraw` function has 2 external calls, one of them being a low call without a check for success. 
The porpose? To revert when the `owner` calls `withdraw`. Because the call to partener doesn't do anything if it fails, than we should consider to make the transfer to owner to fail.

# Solution 
To break the `transfer` call, we have to make the balance of the contract lower than the amount sent.  we can see that we can draw the balance of the contract with multiple calls from the partener, as CEI(Check-Effects-Interactions) is not respected.

You can find the malicious contract that has to be set as partener in `Denialattack.sol`