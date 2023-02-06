# Logic

Even if in the contract we have `public` and `private` visibility, it doesn't mean that the field can't be read. Everything is public on blockchain, so we can read state variables without a getter. Making a variable private only prevents other contracts from accessing it.

State variables are stored in memory slotes of 32 bytes. As we can see in the provided example, the state variables are taking 2 slots, `slot 0` and `slot 1`. Why? Because `bool` take 8 bytes and `bytes32` 32 bytes(as the name says).

Another example:

```
contract Example{
    uint8 public firstVar;
    uint16 public secondVar;
    uint256 public thirdVar;
}
```

In this situation the `firstVar` and `secondVar` are in the same slot, because `uint8` + `uint16` (which occupies 24 bytes) < 32 bytes, so they are stored in the same slot.
So loading `slot[0]` will bring both variables. And loading `slot[1]` will bring only the `thirdVar`.

# Solution

```
const pass = await web3.eth.getStorageAt(contract.address, 1)
await contract.unlock(pass)
```

