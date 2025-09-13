// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

contract simpleStorage {
  uint storeData;

  // set store data
  function set(uint x)public{
    storeData = x;
  }


  function addData(uint x)public {
    storeData = storeData + x;
  }

  function subData(uint x)public{
    storeData = storeData - x;
  }

  function getData() public view returns(uint){
    return storeData;
  }
}