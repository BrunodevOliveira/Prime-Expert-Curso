*** Settings ***
Resource     ./resource.robot

*** Test Case ***
Cenario 1: brincando com dicionarios criando uma pessoa pela keyword
    criando meu dicionario
    imprimir este dicionario

Cenario 2: brincando com dicionarios imprimindo uma pessoa
    imprimir pessoa

Cenario 3: imprimindo minha lista de frutas 
    [Tags]  frutas
    imprimir lista de frutas