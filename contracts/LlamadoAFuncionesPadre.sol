// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
contract ContractPadre {
    event Log(string mensaje);
    function foo() public virtual {
        emit Log("Padre.foo");
    }
    function bar() public virtual {
        emit Log("Padre.foo");
    }
}
contract ContractHijo is ContractPadre {
    
    function foo() public override  {
        emit Log("foo sobreescrita en hijo");
        ContractPadre.foo();
    }
    function bar() public override  {
        
        emit Log("bar sobreescrita en hijo");
        super.foo();
    }
}