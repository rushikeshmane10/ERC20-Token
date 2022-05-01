
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;




import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract simpletoken is ERC20{
    constructor(uint innitialsupply)ERC20("rushikesh","kng"){
        _mint(msg.sender,innitialsupply);
    }
}