# Logic
You have to find the bug that drains the CryptoVault from all the `DET` tokens. A small hint, follow the transfer functions


# Solution

The vulnerability is that if you call the `sweepToken` with the address of `LegacyToken`, it will enter in the `DoubleEntry` contract, call `_transfer` function and transfer the `DET` tokens to the recipient.

After finding the solution, you have to implement the Forta Detection Robot that will detect if in the `msg.data` the `origSender` is the cryptoVault. 

You can find our implementation in the `DetectionRobot.sol`.