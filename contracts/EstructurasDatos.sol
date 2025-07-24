// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract EstructurasDatos {
    struct Cliente {
        uint256 id;
        uint8 edad;
        string nombre;
        uint256 saldo;
        uint256[] operaciones;
    }
    mapping(address => Cliente[]) private carteraClientes;
    modifier validarDatosMinimosAltaCLiente(
        uint8 _edad,
        string memory _nombre,
        uint256 _saldo
    ) {
        require(_edad > 0, "La edad no es valida");
        require(bytes(_nombre).length > 0, "La edad no es valida");
        require(_saldo > 0, "La cantidad de saldo no puede ser 0 o negativa");
        _;
    }
    modifier validarSaldoSuficiente(uint256 _saldo, uint256 _costo) {
        require(_costo <= _saldo, "El cliente no cuenta con saldo suficiente");
        _;
    }

    function altaCliente(
        uint8 _edad,
        string memory _nombre,
        uint256 _saldo
    ) public validarDatosMinimosAltaCLiente(_edad, _nombre, _saldo) {
        uint256[] memory initialOperacion = new uint256[](1);
        initialOperacion[0] = block.timestamp;

        // Create the new Cliente struct
        Cliente memory tmpCliente = Cliente(
            carteraClientes[msg.sender].length,
            _edad,
            _nombre,
            _saldo,
            initialOperacion // Assign the memory array to the struct member
        );
        carteraClientes[msg.sender].push(tmpCliente);
    }

    function getCliente(uint256 id) public view returns (Cliente memory) {
        return carteraClientes[msg.sender][id];
    }

    function listarClientes() public view returns (Cliente[] memory) {
        return carteraClientes[msg.sender];
    }

    function clienteHaceOperacion(uint256 _id, uint256 _costo) public {
        Cliente storage cliente = carteraClientes[msg.sender][_id];
        require(
            _costo <= cliente.saldo,
            "El cliente no cuenta con saldo suficiente"
        );
        cliente.saldo = cliente.saldo - _costo;
        cliente.operaciones.push(block.timestamp);
        carteraClientes[msg.sender][_id] = cliente;
    }

    function regargarSaldo(uint256 _id, uint256 _saldo) public {
        Cliente storage cliente = carteraClientes[msg.sender][_id];
        cliente.saldo = cliente.saldo + _saldo;
        cliente.operaciones.push(block.timestamp);
        carteraClientes[msg.sender][_id] = cliente;
    }
}
