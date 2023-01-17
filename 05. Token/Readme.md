# Logic
Prior solidity 0.8.0, the compiler didn't check for under/overflow. This had to be done manually by devs either with checks or by using a famous OpenZepelin library SafeMath.

At a closer look we observe that the solidity version is 0.6.0 and the contract is not using one of the above solutions for under/overflow vulnerability

Taking in consideration that the caller(us) has 20 token, if we transfer 21 it will underflow and the amount will be much bigger.
To see the effects, run the solution and after it: 
`await contract.balanceOf(player)`

# Solution
```
await contract.transfer("<another_address>", 21)
```
