// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract TestVariables {
    // Variables
    string cadena;
    bool variableBool;
    bytes1 variableEnBytes = "a";
    bytes32 variable32bytes = keccak256("hola");
    address variableDireccion = 0x12EDe5eD5695560F8d12951B2b877E04588bFE89;
    uint8 variableEntera = 30;
    uint32 variableEnteraMasGrande = uint32(variableEntera);
    enum Estado {
        Apagado,
        Encendido
    }
    Estado estado = Estado.Apagado;
    Estado otroEstado = Estado(0);
    uint256 public tiempoActual = block.timestamp;
    uint256 public minutos = 1 minutes;
    uint256 public horas = 1 hours;
    uint256 public dias = 1 days;
    uint256 public semanas = 1 weeks;

    // Funcion para obtener el numero de bits de una variable
    function ObtenerBitsYTipo(uint256 datoEntero)
        public
        pure
        returns (string memory, uint256)
    {
        if (datoEntero <= type(uint8).max) {
            return ("uint8", 8);
        } else if (datoEntero <= type(uint16).max) {
            return ("uint16", 16);
        } else if (datoEntero <= type(uint32).max) {
            return ("uint32", 32);
        } else if (datoEntero <= type(uint64).max) {
            return ("uint64", 64);
        } else if (datoEntero <= type(uint128).max) {
            return ("uint128", 128);
        } else if (datoEntero <= type(uint256).max) {
            return ("uint256", 256);
        } else {
            revert("Numero demasiado grande para ser representado");
        }
    }

    // Funcion que agranda el tamanio de una variable de 8 a 32 bits sin signo
    function CasteoDeVariables(uint8 numero) public pure returns (uint32) {
        return uint32(numero);
    }

    // Funcion que cambia el valor del estado
    function CambiarEstado() public {
        if (estado == Estado.Apagado) {
            estado = Estado.Encendido;
        } else {
            estado = Estado.Apagado;
        }
    }

    // Funcion que retorna el estado
    function ConsultarEstado() public view returns (Estado) {
        return estado;
    }

    // Funciones para manipular el tiempo
    function mas50Segundos() public view returns (uint256) {
        return block.timestamp + 50 seconds;
    }

    function mas60Minutos() public view returns (uint256) {
        return block.timestamp + 60 minutes;
    }

    function mas1Hora() public view returns (uint256) {
        return block.timestamp + 1 hours;
    }

    function mas1Semana() public view returns (uint256) {
        return block.timestamp + 1 weeks;
    }

    //Funcion para agregar tiempo
    function masTiempo(uint256 _segundos)
        public
        view
        returns (
            string memory,
            uint256,
            string memory,
            uint256
        )
    {
        return (
            "Tiempo actual",
            block.timestamp,
            "Tiempo mas adicional",
            block.timestamp + _segundos
        );
    }
}
