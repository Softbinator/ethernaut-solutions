# Logic 
Watch `withdraw` function
We can see that we have an initial check for the balance, a external call to send eth to msg.sender and then the sent amount is substracted from the balance. This is a typical case where CEI (Checks-Effects-Interactions) pattern is not respected. 

Why this is a problem?
External calls can be dangerous, because we can create a looop in the transaction. This is the attack that we will use, called **Reentrancy Attack**.

So we have to pass the initial condition, then on the external call we have to make sure to reenter in the contract. To pass the check, we will donate a small amount. After the donation we initiate our attack by calling the withdraw function.

# Solution
Check `ReentranceAttack.sol`

As we can see in `ReentranceAttack.sol` we declared the `fallback` function in order to reenter the victim contract when the external call is made. Be careful here, we want to withdraw funds while they are still there. Withdrawing with more than the balance will revert the transaction, so the attack will fail

If you declare the `receive` move the logic there, because fallback will not be called, see **09. King** challenge

# Steps:
1. call `donate`.
2. call `withdraw` with a small or equal amount than the amount donated, in this case 0.001 ether.


