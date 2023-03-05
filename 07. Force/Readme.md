# Logic

Even if a contract doesn't have a payable function to accept funds, it doesn't mean that it actually can't receive. 

With the help of `selfdestruct` we can force send funds to an address.

## ATTENTION:
`selfdestruct` will be depracated in the new versions of solidity, starting with `0.8.18`. This behavior will become imposibile in the future with Verkle trees. Seems that the replacement will of opcode `SELFDESTRUCT` will be `SENDALL`, which only moves the funds, without deleting the code. For more infos, check https://eips.ethereum.org/EIPS/eip-4758 

# Solution
Check `ForceAttack.sol`
