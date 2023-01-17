# Logic
There is a catch here, and the knowledge that can help you solve this CTF is related to solidity versions. 

**Until** 0.4.21, the constructor of a contract was a function which name was the same as the contract

**Starting** with 0.4.22, this standard was deprecated and the **constructor** became the new way of declaring it 

We can observe that in our contract the solidity version is 0.6.0, so the function 
```
/* constructor */
function Fal1out() public payable {
        owner = msg.sender;
        allocations[owner] = msg.value;
    }
```
isn't a constructor, but a simple function that can be called anytime.

# Solution
```
await contract.Fal1out()
```
