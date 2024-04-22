// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract JTokens is ERC20{
    address private owner;
    constructor() ERC20("Just My Tokens", "JMT"){
        owner = msg.sender;
    }

    function mint(address _to, uint _amount) external {
        require(msg.sender == owner);
        _mint(_to, _amount);
    }

    function transferTokens(address _to, uint amount) external {
        transfer(_to, amount);
    }

    function burnTokens(uint amount) external {
        _burn(msg.sender, amount);
    }

}