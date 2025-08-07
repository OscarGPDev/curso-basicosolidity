// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract SimpleCounter {
    uint256 private counter;

    function increment() public {
        counter += 1;
    }

    function getCount() external view returns (uint256) {
        return counter;
    }
}

/*Las interfaces nos permiten interactuar con otros contratos, aunque no esten en el mismo archivo, en este
caso SimpleCounter podria estar en otro archivo o ya desplegado, lo unico que necesitamos es la firma de las
funciones para poderlas utilizar
*/
interface ISimpleCounter {
    function increment() external;

    function getCount() external view returns (uint256);
}

contract SimpleCounterConsumer {
    //se requiere la direccion del contrato
    function increaseAndGet(address contrato) external returns (uint256) {
        ISimpleCounter(contrato).increment();
        return ISimpleCounter(contrato).getCount();
    }
}
