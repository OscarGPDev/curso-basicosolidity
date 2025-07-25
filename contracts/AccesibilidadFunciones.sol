// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract TestVisibilidad {
    uint256 private dato;
    uint256 internal datoInterno;

    function funcionPublica(uint256 _nuevoDato) public {
        dato = _nuevoDato;
        //No se puede hacer, ya que al ser externa no la podemos usar aunque sea el mismo contrato
        //funcionExterna(_nuevoDato);
    }

    function funcionPrivada(uint256 _nuevoDato) private {
        dato = _nuevoDato;
    }

    function funcionHeredable(uint256 _nuevoDato) internal {
        dato = _nuevoDato;
    }

    function funcionExterna(uint256 _nuevoDato) external {
        dato = _nuevoDato;
    }
}

contract TestVisibilidadInternal is TestVisibilidad {
    function funcionHija(uint256 _nuevoDato) public {
        //No se puede hacer porque la variable es privada, no interna
        //dato=_nuevoDato;
        
        //Se puede hacer porque la variable es interna y estamos heredando el otro contrato
        datoInterno = _nuevoDato;

        //No es accesible porque es privada, necesita ser interna
        //funcionPrivada(_nuevoDato);

        //Es accesible porque es interna y estamos heredando el otro contrato
        funcionHeredable(_nuevoDato);

        //Al ser externa solo podemos acceder a ella por fuera, no por herencia
        //funcionExterna(_nuevoDato);

        //Se puede usar porque la funcion es accesible publicamente
        funcionPublica(_nuevoDato);
    }
}
