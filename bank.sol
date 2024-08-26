// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./token.sol";

contract XofeyaBank {
    XofeyaToken internal token;

    mapping(address => uint256) public balances;

    constructor(address _tokenAddress) {
        token = XofeyaToken(_tokenAddress);
    }

    // Deposit function: users deposit tokens into the bank
    function deposit(uint256 _amount) public {
        require(token.transferFrom(msg.sender, 0x025a67f82571889BE513F7D8581fA206DE5e47AC, _amount), "Transfer");
        balances[msg.sender] += _amount; 
    }

    // Withdraw function: users withdraw tokens from the bank
    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        require(token.transfer(msg.sender, _amount), "Transfer");
    }

    // Check the bank's token balance
    function getBankBalance() public view returns (uint256) {
        return token.balanceOf(0xB9a45A5e040d6805F847599d8E814012A40cD44C);
    }
}