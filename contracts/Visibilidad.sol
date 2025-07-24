// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ModificadoresDeAcceso {
    //variables publicas
    uint256 public numero = 8;
    string public texto = "Soy una variable publica";
    bool public boolean = true;
    address public direction = 0x12EDe5eD5695560F8d12951B2b877E04588bFE89;
    // variables privadas;
    uint256 private numeroPrivado = 20;
    string private textoPrivado = "U can't see me";
    bool private booleanoPrivado = false;
    // Variables internas, solo se accede desde el mismo o que hereden de el.
    uint256 internal numeroInterno = 20;
    string internal textoInterno = "Secreto de familia";
    bool internal booleanoInterno = false;

    // Obtiene el valor de una variable privada
    function obtenerTextoPrivado() public view returns (string memory) {
        return textoPrivado;
    }
    // Obtiene el valor de una variable interna
    function obtenerTextoInterno() public view returns (string memory) {
        return textoInterno;
    }
}

contract ContratoHijo is ModificadoresDeAcceso{
    function obtenerTextoInternoHijo() public view returns (string memory) {
        return textoInterno;
    }
}