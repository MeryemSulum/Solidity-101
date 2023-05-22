// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Example{

    // These are storage variables. State variables are existing
    // on the blockchain and saved to storage.
    uint storedData;  //stored in storage
    string storedString;  //stored in storage

    // Data locations - storage, memory and calldata

    // storage means the variable is a `state` variable
    // memory means the data is loaded onto memory
    // calldata is like memory except it can only be used for function inputs

    // NOTE:
    // calldata is not modifiable
    // it takes parameter from the input and passes it into
    // anything without copying it.
    // so that is how it saves gas :)

    // memory is copies each element in the variable
    // and creating a new variable inside the memory and
    // pass it into anywhere
    function set(uint x, string calldata s) public {
        storedData = x;   //set value in storage
        storedString = s;   //set string value in storage
    }

    function get() public view returns (uint, string memory) {
        return (storedData, storedString);  //read from storage
    }

    function double(uint[] calldata nums) public pure returns (uint[] memory) {
        uint[] memory result = new uint[](nums.length);

        for (uint i = 0; i < nums.length; i++) {
            result[i] = nums[i] * 2 ;  //stored in memory
        }
        return result;  //returned from memory
    }
}