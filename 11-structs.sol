// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Structs{
    struct User{
        string name;
        uint age;
        address wallet;
    }

    // We are declaring an array formed of User struct.
    User[] public users;

    // In this function we used 3 different usages of the structs.
    // You can declare any kind of the method but the second one is preferred
    function doOperations() external {
        User memory user1 = User("Joe", 34, msg.sender);
        User memory user2 = User({name: "Alice", age: 23, wallet: msg.sender});
        User memory user3;
        user3.name = "John";
        user3.age = 43;
        user3.wallet = msg.sender;

        users.push(user1);
        users.push(user2);
        users.push(user3);

    }
}