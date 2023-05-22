// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface SomeInterface {
    function someFunction(uint someArgument) external returns (uint);
    // Don't create body of the function!
}
    //Differences between Abstract Contracts and Interfaces
    // 1-Both interfaces and abstract contracts can declare functions without implementation details.
    // 2-Interfaces provide a standardized interface for other contracts to interact with, while abstract contracts
        //provide a blueprint for other contracts to inherit from.
    // 3-Interfaces can be implemented by any contract that provides implementation for its methods,while abstract contracts
        //must be inherited by other contracts that provide implementation for its methods.
    // 4-Abstact contracts can contain variables an modifiers, while interfaces cannot. 


contract ContractA {
    uint256 public someValue;

    function setValue(uint256 newValue) external {
        someValue = newValue;
    }
}

interface ContractAInterface {
    function setValue(uint256) external;
}

contract ContractB {
    function setValueOnContractA(address _contractA, uint256 newValue) public {
        ContractAInterface(_contractA).setValue(newValue);
    }
}

// HOW TO TEST THAT?

// 1) Deploy `ContractA` and set a value.
// 2) Deploy `ContractB`
// 3) Copy the address of the deployed `ContractA`
// 4) Paste the address to `setValueOnContractA` and set your number
// 5) check `ContractA` `someValue` variable. It must be changed.