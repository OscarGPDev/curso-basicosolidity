// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract TestOwnableContract {
    address public propietario;

    constructor() {
        propietario = msg.sender; //Al ejecutarse al deployar, este valor seria el del propietario
    }

    modifier soloPropietario() {
        require(
            propietario == msg.sender,
            "No eres el propietario del contrato"
        );
        _;
    }

    function transferirPropiedad(address _nuevoPropietario)
        external
        soloPropietario
    {
        require(
            _nuevoPropietario != propietario,
            "La nueva direccion es la misma a la registrada"
        );
        propietario = _nuevoPropietario;
    }

    function funcionPublicaSinRestriccion()
        external
        pure
        returns (string memory)
    {
        return "Todos pueden ejecutar esta funcion";
    }

    function funcionSoloAlPropietario()
        external
        view
        soloPropietario
        returns (string memory)
    {
        return "Eres el propietario y puedes ejecutar esta funcion";
    }
}
