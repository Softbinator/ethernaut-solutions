# ATTENTION

The contract present in `Preservation.sol` can't be hacked, as the conversion from `uint` to `address` is not possible anymore (solidity version >= `0.8.0`). We suggest to change the solidity version with lower one, in order to show the vulnrability, as we did in `PreservationChanged.sol`.

We will refer to `PreservationChanged.sol` as `Preservation.sol`, to make easier to follow.

# Logic

As we saw in the previous challenges, `delegatecall` will call the function with the current contract storage. We can observe that the Library changes the first slot of the `Preservation` contract, as the `x` variable in the `Library` is in the slot 0. So using the functions `setFirstTime` and `setSecondTime` will change the `timeZone1Library` (see variable packing). 

# Solution
Using the `delegatecall` knowledge, in order to change the `owner` field, we need a contract that matches the same storage slots. Let's build a contract that does that. 

So, now we can manipulate the `Preservation` storage trough `PreservationAttack`. To do it, we have to deploy the `PreservationAttack` and to store the address in the `timeZone1Library` from the target contract. 

How to to that? 
We can convert the address of `PreservationAttack` to uint and pass it to one of the function present in the target contract (example: `setFirstTime`)

```
#convert address to uint
uint(<attacker_contract_adress>)
```

 Now we can call functions from the `PreservationAttack`. But, we see that we need `setTime(uint256)` to match the `setTimeSignature` and add there a change to the `owner` value. Buld it and than call the **first function now** `setFirstTime`, as only the `timeZone1Library` is changed.

 You can find the attack contract at `PreservationAttack.sol`
