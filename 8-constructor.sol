// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract ConstructorExample  {
    address public owner;
    string public name;
    uint public age;


    // The constructor function is a function that only runs on the deployment
    // It can take parameters like other functions but the key difference is
    // When you deploy a contract it will be executed once
    constructor(string memory _name, uint _age){  //initialize state variablies
        owner = msg.sender;
        name = _name;
        age = _age;
    }

    // modifier functions are pre-checks for rules of function execution.
    // At the example above, we declared that only the owner of the function can call this
    // But why we didn't write this into the `changeName` function?
    // Because we can use many different functions special to owner of the contract.
    // Instead of declaring same logic everytime, we declared it once and can use anytime we need.
    modifier onlyOwner() {  //putting conditions to function
        require(msg.sender == owner, "Only the owner can call this functon.");
        _;
    }
    function changeName(string memory _newName)public onlyOwner{
        name = _newName;
    }

}