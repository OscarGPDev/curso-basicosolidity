// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract TestRolesContract {
    enum roles {
        Admin,
        UserType1,
        UserType2
    }
    mapping(roles => mapping(address => bool)) private controlDeAcceso;

    constructor() {
        controlDeAcceso[roles.Admin][msg.sender] = true;
    }

    modifier soloAdmin() {
        require(controlDeAcceso[roles.Admin][msg.sender], "Solo admin");
        _;
    }
    modifier accionPermitida(roles _rol) {
        require(
            controlDeAcceso[_rol][msg.sender],
            "Tu tipo de usuario no permite esta accion"
        );
        _;
    }

    function asignarRol(address _direccionQueTendraAcceso, roles _rol)
        external
        soloAdmin
    {
        controlDeAcceso[_rol][_direccionQueTendraAcceso] = true;
    }

    function revocarRol(address _direccionQueYaNoTendraAcceso, roles _rol)
        external
        soloAdmin
    {
        controlDeAcceso[_rol][_direccionQueYaNoTendraAcceso] = false;
    }

    function funcionPublicaSinRestriccion()
        external
        pure
        returns (string memory)
    {
        return "Todos pueden ejecutar esta funcion";
    }

    function funcionSoloAdmin()
        external
        view
        soloAdmin
        returns (string memory)
    {
        return "Eres admin y puedes ejecutar esta funcion";
    }

    function funcionSoloUsuariosN1()
        external
        view
        accionPermitida(roles.UserType1)
        returns (string memory)
    {
        return "Tu usuario te permite ejecutar esta accion";
    }

    function funcionSoloUsuariosN2()
        external
        view
        accionPermitida(roles.UserType2)
        returns (string memory)
    {
        return "Tu usuario te permite ejecutar esta accion";
    }
}
