# Logic

We can't trust a strange contract to handle logic in our contract, even if we declare an interface for it. The implementation can be different from what we expect from it.

Also 2 differents calls of the same function don't have to return the same result.

# Solution
Check `ElevatorAttack.sol`
