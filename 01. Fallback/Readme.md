# Logic
To complete you have to send a transaction without msg.data to call receive function

# Solution
```
await contract.contribute({value: 1})
await sendTransaction({value: 1, from: "<your_address>", to: "<contract_address>"})
await contract.withdraw()
```


