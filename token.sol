// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract XofeyaToken is ERC20, Ownable (msg.sender) {
    constructor() ERC20("XofeyaToken", "XTN") {
        _mint(msg.sender, 30 * 10 ** 18);
    }

    function mint(address, uint256 amount) public onlyOwner{ 
             uint256 amountWithDecimals = amount * 10 ** 18;
           _mint(address, amountWithDecimals) ;
    }
}
