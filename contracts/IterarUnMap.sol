// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract IterandoUnMapp {
    mapping(address => uint256) public saldos;
    mapping(address => bool) public clientesExistentes;

    address[] public clientes;

    function agregarCliente(address _cliente) public {
        saldos[_cliente] = 0;
        if (!clientesExistentes[_cliente]) {
            clientes.push(_cliente);
            clientesExistentes[_cliente] = true;
        }
    }

    function agregarSaldo(address _cliente, uint256 _saldo) public {
        require(clientesExistentes[_cliente], "El cliente no existe");
        saldos[_cliente] += _saldo;
    }

    function clientesRegistrados() public view returns (uint256) {
        return clientes.length;
    }

    function primerCliente() public view returns (uint256) {
        return saldos[clientes[0]];
    }

    function ultimoCliente() public view returns (uint256) {
        return saldos[clientes[clientes.length - 1]];
    }

    function reiniciarSaldos() public {
        for (uint256 i = 0; i < clientes.length; i++) {
            saldos[clientes[i]] = 0;
        }
    }
}
