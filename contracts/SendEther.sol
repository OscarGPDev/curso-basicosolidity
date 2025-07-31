// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function testTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function testSend(address payable _to) external payable {
        bool send = _to.send(123);
        require(send, "send fallo");
    }
    function testCall(address payable _to) external payable  {
        (bool success, )=_to.call{value:123}("");
        require(success, "La llamada fallo");
    }
}
contract ReciveEther {
    event Log(uint amount,uint gas);
    receive() external payable { 
        emit Log(msg.value, gasleft());//gasleft() nos permite saber el gas restante
    }
}