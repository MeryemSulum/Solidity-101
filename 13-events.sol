// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//The purpose of the "Event" is tracking the operations.
//Events are defined within the contract code and are emitted(işlenmek) when a specific condition is met.

contract MyContract{
    event NewTransaction(uint indexed transactionId, address indexed sender, address indexed recipient, uint amount);

    function transfer(address recipient, uint amount) public {
        require(amount >= 400, "The amount is less than expected");
        uint transactionId = 123;
        emit NewTransaction(transactionId, msg.sender, recipient, amount);
    }
}