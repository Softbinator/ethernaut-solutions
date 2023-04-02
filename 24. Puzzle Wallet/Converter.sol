pragma solidity ^0.8.0;

contract Converter{

    function convert(address my_address) external pure returns(uint256){
        return uint256(uint160(my_address));
    }
    
}