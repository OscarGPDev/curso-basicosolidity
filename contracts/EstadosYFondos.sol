// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract EstadosFondos {
    uint256 acumulado;
    struct Cuenta {
        string nombre;
        address cuenta;
        uint256 saldo;
    }
    mapping(address => Cuenta) private cuentas;

    // esta funcion es pure porque no utiliza datos almacenados
    function funcionSuma(uint256 _a, uint256 _b) public pure returns (uint256) {
        return _a + _b;
    }

    // esta funcion no es pure porque accede al estado pero tampoco view porque lo modifica
    function funcionAcumulado(uint256 _agregar) public {
        acumulado = acumulado + _agregar;
    }

    //esta funcion es view porque accede al estado pero no lo modifica
    function verAcumulado() public view returns (uint256) {
        return acumulado;
    }

    function agregarCuenta(string memory _nombre) public {
        cuentas[msg.sender] = Cuenta(_nombre, msg.sender, 0);
    }

    function recargarSaldo() public payable {
        cuentas[msg.sender].saldo = cuentas[msg.sender].saldo + msg.value;
    }

    function verSaldo(address _cuenta) public view returns (Cuenta memory) {
        Cuenta memory c = cuentas[_cuenta];
        return c;
    }
}
