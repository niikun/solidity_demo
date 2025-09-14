// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract Will {
    address owner;
    uint fortune;
    bool deceased;

    constructor() payable public {
        owner = msg.sender; //msg sender represents address that is called
        fortune = msg.value;
        deceased = false;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    modifier mustBeDeceased {
        require(deceased == true);
        _;
    }
    // list of famly address
    address payable[] familyWallets;

    // map through inheritance
    mapping(address=> uint) inheritance;

    // set inheritance for each address

    function setInheritance(address payable wallet, uint amount) public onlyOwner {
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    function isDeceased() public onlyOwner {
        deceased = true;
        payout();
    }

    // pay each family member based on their wallet
    function payout() private mustBeDeceased {
        for (uint i=0; i < familyWallets.length; i++) {
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }
}