// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ManejoErrores {
    error ErrorPersonalizado(address direccion, string mensaje);

    function manejoPorRequire(uint8 edad) public pure returns (string memory) {
        require(edad > 18 && edad < 150, "No es una edad valida");
        return "La edad es valida";
    }

    function manejoPorRevert(uint8 edad) public pure returns (string memory) {
        if (edad < 18 || edad > 150) {
            revert("No es una edad valida");
        }
        return "La edad es valida";
    }

    function manejoPorAssert(uint8 edad) public pure returns (string memory) {
        assert(edad > 18 && edad < 150);
        return "La edad es valida";
    }

    function manejoPorRevertConErrorPersonalizado(uint8 edad)
        public
        view
        returns (string memory)
    {
        if (edad < 18 || edad > 150) {
            revert ErrorPersonalizado(msg.sender, "No es una edad valida");
        }
        return "La edad es valida";
    }
}
