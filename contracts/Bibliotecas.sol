// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

library MyUsefulFunctions {
    function bigger(uint256[] memory a) public pure returns (uint256, uint256) {
        uint256 i = 0;
        uint256 pos = 0;
        uint256 result = a[0];
        for (i = 0; i < a.length; i++) {
            if (a[i] > result) {
                pos = i;
                result = a[i];
            }
        }                                                                                                                                                                               
        return (pos, result);
    }

    function minor(uint256[] memory a) public pure returns (uint256, uint256) {
        uint256 i = 0;
        uint256 pos = 0;
        uint256 result = a[0];
        for (i = 0; i < a.length; i++) {
            if (a[i] > result) {
                pos = i;
                result = a[i];
            }
        }
        return (pos, result);
    }
}

contract ManejoArreglos {
    uint256 biggerEvaluated = 0;

    function EvaluarArreglo(uint256[] memory _x)
        external
        returns (uint256 index, uint256 result)
    {
        (uint256 pos, uint256 bigger) = MyUsefulFunctions.bigger(_x);
        if (bigger > biggerEvaluated) {
            biggerEvaluated = bigger;
        }
        return (pos, bigger);
    }

    function historicalMaximun() external view returns (uint256) {
        return biggerEvaluated;
    }
}
