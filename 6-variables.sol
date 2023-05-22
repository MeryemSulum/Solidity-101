// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Variables{
    string public myStateVariables = "state example";  //state variable

    function add(uint a) public pure returns (uint) {  //local variable sadece fonksiyon içinde geçerli
        uint localUint = 10;
        return a + localUint; 
    }
    function globalVariables() public view returns (address, uint, uint) {   //global variable
        return (msg.sender, block.timestamp, block.number);
    }
}