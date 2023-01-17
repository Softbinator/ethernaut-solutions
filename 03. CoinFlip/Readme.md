# Logic
A easy way to break that contract is to run the same login of fliping inside in a contract and than, after we find the result we call the victim contract.

# Why this works?
Because block.number is the same as as in the victim contract, because even if we call another contract, all the actions are in a single transaction, thus in the same block

# Solution 
Technical solution is in `CainFlipAttack.sol`