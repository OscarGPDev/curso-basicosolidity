// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract BloquesDeControl {
    mapping(address => bytes32[]) private cadenasValidadas;

    function CompararDosString(string memory _a, string memory _b)
        private
        pure
        returns (bool, bytes32)
    {
        bytes32 hashA = keccak256(abi.encodePacked(_a));
        return (hashA == keccak256(abi.encodePacked(_b)), hashA);
    }

    function ComparacionesExitosasPorCuenta(bytes32 cadenaValidada)
        private
        returns (bool)
    {
        bytes32[] storage cadenasValidadasEnLaCuenta = cadenasValidadas[
            msg.sender
        ];
        bool encontrada = false;
        for (uint256 i = 0; i < cadenasValidadasEnLaCuenta.length; i++) {
            if (cadenasValidadasEnLaCuenta[i] == cadenaValidada) {
                encontrada = true;
            }
        }
        if (!encontrada) {
            cadenasValidadasEnLaCuenta.push(cadenaValidada);
        }
        return encontrada;
    }

    function ValidarCadena(string memory _a, string memory _b)
        public
        returns (bool, string memory)
    {
        (bool comparacion, bytes32 hash) = CompararDosString(_a, _b);
        string memory cadenaValidada = "";
        bool operacionRepetida = ComparacionesExitosasPorCuenta(hash);
        if (comparacion && operacionRepetida) {
            cadenaValidada = "Esta operacion ya se habia efectuado";
        } else if (comparacion && !operacionRepetida) {
            cadenaValidada = "Esta operacion no se habia efectuado";
        } else {
            cadenaValidada = "Los elementos no son iguales";
        }
        return (comparacion, cadenaValidada);
    }

    function encontrarElPrimerPar(int256[] memory _numeros)
        external
        pure
        returns (bool, int256)
    {
        int256 resultado = 0;
        bool continuar = true;
        uint256 indice = 0;
        while (continuar && indice < _numeros.length) {
            int256 num = _numeros[indice];
            if (num % 2 == 0) {
                continuar = false;
                resultado = num;
            }
            indice++;
        }
        /* si continuar nunca cambio, significa que no habia un numero par y regresamos 0 por defecto
           si continuar cambio a false, significa que encontramos un numero par y lo regresamos
        */
        return (!continuar, resultado);
    }
}
