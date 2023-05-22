// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Errors{
    uint storedData;

    // `require` function takes 2 parameters.
    // first one is the successful condition
    // and second one is the failure messaage.
    // if the succesful condition happens, the function will continue to execution
    // if not, the failure message will be send and transaction will be reverted.

    // as an example, we said that x must not equal to zero.
    // if its equal send "x can not be zero"
    function set(uint x) public {
        require(x != 0, "x cannot be zero"); //require statement to check input
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }

    // Here again, we are check the result with 2 conditions
    // if one of both is true, it will execute the `revert` function with the failure message.
    function add(uint x, uint y) public pure returns (uint) {
        uint result = x + y;
        if (result < x || result < y){
            revert("result overflowed"); //revert statement to handle overflow
        }
        return result;
    }

    // assert is using for unexpected conditions like the example above.
    // If the condition is false, it will be giving an error and reverting.It's means bug.
    function divide(uint x, uint y) public pure returns (uint) {
        assert(y != 0); //assert statement to check for division by zero
        return x / y;
    }
}