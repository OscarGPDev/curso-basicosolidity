// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
contract TestConstantes {
    uint constant public MAX_NUM = 100;
    function esMayor(uint _entrada) public pure returns (bool) {
        return _entrada > MAX_NUM;
    }
}