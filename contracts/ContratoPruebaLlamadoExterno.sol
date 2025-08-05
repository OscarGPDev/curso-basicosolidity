// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ContratoPruebaConsumer {
    function setX(ContratoPrueba _test, uint256 _x) external {
        _test.setX(_x);
    }

    function getX(address _test) external view returns (uint256 x) {
        x = ContratoPrueba(_test).getX();
    }

    // establece el valor de x y envia ether al contrato ContratoPrueba
    function setXandSendEther(address _test, uint256 _x) external payable {
        ContratoPrueba(_test).setXandReciveEther{value: msg.value}(_x);
    }

    function getXandValue(address _test)
        external
        view
        returns (uint256 x, uint256 value)
    {
        (x, value) = ContratoPrueba(_test).getXandValue();
    }
}

contract ContratoPrueba {
    uint256 public x;
    uint256 public value = 123;

    function setX(uint256 _x) external {
        x = _x;
    }

    function getX() external view returns (uint256) {
        return x;
    }

    function setXandReciveEther(uint256 _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint256, uint256) {
        return (x, value);
    }
}
