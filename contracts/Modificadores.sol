// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
contract MisModificadores {
    address public propietario;
    constructor() {
        propietario = msg.sender;
    }
    modifier esPar(uint _numero) {
        require(_numero % 2 == 0, "El numero informado es impar");
        _;
    }
    modifier noEsCero(address _direccion) {
        require(_direccion != address(0), "La direccion informada es 0");
        _;
    }
    modifier noEstaVacia(string memory _cadena) {
        require(bytes(_cadena).length > 0, "La cadena ingestada esta vacia");
        _;
    }
    // Valida si quien llama la funcion es el propietario
    modifier soloPropietario() {
        require(msg.sender == propietario, "Solo el propietario peude llamar esta funcion");
        _;
    }
    function mensaje() public pure returns(string memory){
        return "Se esta ejecutando una funcion";
    }
}
