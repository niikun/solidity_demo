// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract Coin {
    address public minter;
    address[] public user;
    mapping(address=>uint) public balanceOf;
    uint256 public totalSupply;

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Mint(address indexed to, uint256 amount);

    constructor(){
        minter = msg.sender;
        uint256 initial = 1_000_000;
        totalSupply = initial;
        balanceOf[minter] = initial;
        emit Mint(minter, initial);
        emit Transfer(address(0), minter, initial);
    }

    modifier onlyOwner(){
        require(msg.sender == minter, "Only owner can call this function");
            _;
    }


    function mint(address receiver, uint amount)public onlyOwner{
        require(receiver != address(0), "Reciever can't be zero address");
        totalSupply += amount;
        balanceOf[receiver] += amount;
        emit Mint(receiver, amount);
        emit Transfer(address(0),receiver, amount);
    }

    function transfer(address receiver, uint amount)public{
        require(receiver!= address(0), "Reciever can't be zero address");
        require(balanceOf[msg.sender] >= amount,"Not enough balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[receiver] += amount;
        emit Transfer(msg.sender, receiver, amount);
    }
}