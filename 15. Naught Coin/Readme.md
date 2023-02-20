# Logic

After reading the smart contract we can see that transfering the coin from our account, by signing the tx ourselfs, is not possible. So, if we can't send the token, how about asking somebody else to transfer them in our name. 

After analysing the ERC20 contract, we can see that this is possible by approving an address to transfer the coins that we own. 

# Solution
I will present the solution in 2 ways:
1. If it was a real contract we could do this by entering in etherscan, calling approve function with the account that deployed the contract and then switch to second account (the approved one) and transfer the assets
2. I made a small script/task in hardhat, and you can find it in `script.ts`
