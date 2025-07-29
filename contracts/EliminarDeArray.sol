// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract DesplazamientoEnArray {
    uint256[] public arreglo;

    function agregarElemento(uint256 _elemento) public {
        arreglo.push(_elemento);
    }

    modifier indiceValido(uint256 _indice) {
        require(_indice < arreglo.length, "El indice esta fuera del arreglo");
        _;
    }

    function obtenerElemento(uint256 _indice)
        public
        view
        indiceValido(_indice)
        returns (uint256)
    {
        return arreglo[_indice];
    }

    function restablecerValor(uint256 _indice) public indiceValido(_indice) {
        delete arreglo[_indice]; // El tamanio del arreglo no se modifica, el valor en esa posicion se vuelve el default
    }

    function listarElementos() public view returns (uint256[] memory) {
        return arreglo;
    }

    function remove(uint256 _indice) public indiceValido(_indice) {
        //es una operacion cara
        for (uint256 i = _indice; i < arreglo.length - 1; i++) {
            arreglo[i] = arreglo[i + 1];
        }
        arreglo.pop();
    }

    //Esta forma de eliminar es mas barata pero se pierde el orden
    function removeCheap(uint256 _indice) public indiceValido(_indice) {
        arreglo[_indice] = arreglo[arreglo.length - 1];
        arreglo.pop();
    }
}
