# Logic

We can see that `Recovery` contract emits new tokens, without making visible the address of the `SimpleToken` created. Also we saw that the `SimpleToken` contract has a method that calls `selfdestruct`.

# Solution

How can we find the address?
You have to investigate with the network block explorer that you are using. We used polygon mumbai network, so we tracked our `Create Level Instance` tx. Yu can find this tx in multiple ways. The easier is to search in the block explorer the address from which you created the instance. After you identified the tx, take a look what happened in that tx. Search for the txHash. You can observe that in your tx multiple actions were made, and the last one shows where the 0.001 assets where sends (`SimpleToken` contract address)

After finding the address we have to call the `destroy` method with our address and done, we completed the level

The last part we have done by creating a script in hardhat (development tool). You can find this script in `HardhatScript.ts` file.

To run it see hardhat tutorials, that can be found on their site.
```
npx hardhat script:attackRecovery --network <network_identifier_in_config_file>
```