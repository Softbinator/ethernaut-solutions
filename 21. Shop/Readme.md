# Logic
We need to make the price to be lower than 100. Pay attention that the result of `_buyer.price()` is not stored anywhere, so there are 2 external calls.

# Solution
We need to create a contract `Buyer` that on a **view** function, `price`, has to return different outputs. Because it is a view function we can't store in a state a value in order to know if it is a second call to return something lower than 100. 

But, actually, we can use the target contract, `Shop`. As we can see, between the 2 external calls, we have a change of state, `isSold = true`, and it is a public variable. 

So we can use in our `price` function that trick, and return different result if `isSold` is **true** of **false**, as if it is false we return 100, else return something lower than 100, let's say 10. 

Also, don't forget to init your attack from the `Buyer` contract.

You can find the code in `ShopAttack.sol`