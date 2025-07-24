// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
pragma abicoder v2;

contract FuncionesGlobales {
    // Funcion msg.sender
    function obtenerDireccion() public view returns (address) {
        return msg.sender;
    }

    // Funcion block.timestamp
    function obtenerTiempo() public view returns (uint256) {
        return block.timestamp;
    }

    // Funcion bloack.number
    function obtenerNumeroBloque() public view returns (uint256) {
        return block.number;
    }

    // Funcion basica para obtener un hash keccak256
    function obtenerHash(string memory texto) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(texto));
    }

    // Funcion para comparar string
    function compararString(string memory texto1, string memory texto2)
        public
        pure
        returns (bool)
    {
        if (
            keccak256(abi.encodePacked(texto1)) ==
            keccak256(abi.encodePacked(texto2))
        ) {
            return true;
        } else {
            return false;
        }
    }
}
