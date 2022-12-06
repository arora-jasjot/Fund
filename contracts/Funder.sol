// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Funder{
    uint256 public numberOfFunders;
    mapping(uint256 => address) private funders;

    receive() external payable {}

    function transfer() external payable{
        funders[numberOfFunders] = msg.sender;
    }

    function withdraw (uint256 withdrawableAmount) external{
        require(withdrawableAmount <= 2000000000000000000, 'Amount must be upto 2 ether only!');
        payable(msg.sender).transfer(withdrawableAmount);
    }
}