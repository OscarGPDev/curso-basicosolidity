// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract DoofenshmirtzContract {
    constructor() payable {}

    function RedButton() external {
        selfdestruct(payable(msg.sender));
    }

    function echo() external pure returns (bool) {
        return true;
    }
}
