// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0<0.9.0;
contract Operadores {
    //Matematicos
    uint public suma = 2+4;
    int public resta = 2-4;
    uint public multiplicacion = 2*4;
    uint public division = 10/2;
    uint public modulo = 5%2;
    
    //Comparacion
    bool public igual = 2==2;
    bool public diferente = 2!=2;
    bool public menor = 2<2;
    bool public mayor = 2>2;
    bool public menorIgual = 2<=1;
    bool public mayorIgual = 2>=1;
    
    //Logicos
    bool public and = (2==2) && (3==3);
    bool public or = (2==3) || (3==3);
    bool public negacion = !true;
    
}