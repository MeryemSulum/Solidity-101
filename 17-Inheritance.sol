// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


//Inheritance kalıtım, miras anlamına gelir. Parent-Child mantığı.
//Contract'ların bir çok özelliğini tekrar yazmadan yeni Contract'larda kullanmamızı sağlıyor.


contract Parent{
    uint public parentData;

    constructor(uint _parentData){
        parentData = _parentData;
    }
}


contract Child is Parent{
    uint public childData;


    // We are declaring `_parentData` of `Parent` contract.
    // The constructor passes _parentData to the Parent constructor using Parent(_parentData) syntax.
    constructor(uint _parentData, uint _childData) Parent(_parentData) {
        childData = _childData;
    }
}