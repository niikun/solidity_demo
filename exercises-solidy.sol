// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract excersesSolidity{
    uint public changeValue;
    string public tom = "Hello";

    function f() public pure returns (uint, bool, string memory){
        return (3, true,"Good");
    }

    function g() public{
        (changeValue,,tom) = f();
    }
}

