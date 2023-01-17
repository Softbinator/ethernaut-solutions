# Logic

To accomplish this level you have to know the difference between `tx.origin` and `msg.sender`

**tx.origin** is the address that initiated the transaction

**msg.sender** is the caller of the current smart-contract

## How we make them to be distinct?

By creating a intermediary. We create a smart-contract(`TelephoneAttack`) that will call the `Telephone`. See attached photo

# Solution
Check `TelephoneAttack.sol`


