// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
contract ContratoVariableInmutable {
    address public immutable owner;
    address public visitant;
    event Log(string);
    enum TipoVisitante {Owner, Visitante }
    uint public visits_counter;
    constructor() {
        owner = msg.sender;
    }
    function foo()external {
        if(msg.sender==owner){
            emit Log("Eres el owner");
        }
        visits_counter+=1;
    }
}