// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Eventos {
    //devuelven un evento en visible en los logs de la ejecucion de una TX
    event AperturaExitosa(string nombre, bytes32 id, uint256 saldo);
    enum TipoOperacion {
        Recarga,
        Consumo
    }
    //agregar indexed permite filtrar este evento por ese parametro en los logs
    event Operacion(TipoOperacion indexed tipo, string nombre, uint256 importe);
    struct Cuenta {
        string nombre;
        uint256 saldo;
    }
    mapping(address => Cuenta) private cuentas;

    function abrirCuenta(string memory nombre) external {
        cuentas[msg.sender] = Cuenta(nombre, 0);
        emit AperturaExitosa(
            nombre,
            keccak256(abi.encodePacked(nombre, msg.sender)),
            0
        );
    }

    function recargar(uint256 importe) external {
        Cuenta memory cuentaCliente = cuentas[msg.sender];
        cuentaCliente.saldo += importe;
        emit Operacion(TipoOperacion.Recarga, cuentaCliente.nombre, importe);
    }

    function consumir(uint256 importe) external {
        Cuenta memory cuentaCliente = cuentas[msg.sender];
        cuentaCliente.saldo += importe;
        emit Operacion(TipoOperacion.Consumo, cuentaCliente.nombre, importe);
    }

    function consultarCuenta() public view returns (Cuenta memory) {
        return cuentas[msg.sender];
    }
}
