// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0<0.9.0;
contract ContratoVehiculo {
    string internal marca;
    string internal modelo;
    uint16 internal anio;
    uint8 internal puertas;
    function encender()public virtual pure returns (string memory){
        return "El vehiculo se ha encendido";
    }
    function apagar()public virtual pure returns (string memory){
        return "El vehiculo se ha encendido";
    }
    function acelerar()public pure returns (string memory){
        return "El vehiculo esta acelerando";
    }
}
contract ContratoAutomovil is ContratoVehiculo{
    bytes32 public placas;
}
contract ContratoLancha is ContratoVehiculo{   
    uint public numeroAmarre;
    function anclar() public pure returns (string memory) {
        return "La lancha ha anclado";
    }
}
contract ContratoBicicleta is ContratoVehiculo{
    uint8 public velocidades;
    function encender()public override  pure returns (string memory){
        return "La bicicleta esta lista";
    }
    function apagar()public override  pure returns (string memory){
        return "La bicicleta se ha detenido";
    }
}
contract ContratoVehiculoAnfibio is ContratoAutomovil, ContratoLancha {
    enum Modo{Terrestre,Acuatico}
    Modo public modo;
    function cambiarModo() public{
        if(modo==Modo.Acuatico){
            modo=Modo.Terrestre;
        }
    }
}