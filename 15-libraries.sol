// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

library MyLibrary{
    function double(uint[] memory nums) pure public returns (uint[] memory) {
        uint[] memory result = new uint[](nums.length);

        for (uint i = 0; i < nums.length; i++) {
            result[i] = nums[i] * 2;
        }
        return result;
    }
}