// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract MyContract {
    //Variable de estado(Se almacena en la blockchain)
    string private mensaje;

    // Constructor: se ejecuta una vez al desplegar el contrato
    constructor() {
        mensaje = "Hello World";
    }
    //Funcion para obtener el mensaje actual
    function getMensaje() public view returns (string memory) {
        return mensaje;
    }
    //Funcion para actualizar mensaje
    function updateMensaje(string memory nuevoMensaje) public {
        mensaje = nuevoMensaje;
    }
}
