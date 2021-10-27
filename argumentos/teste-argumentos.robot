*** Settings ***
Resource    ./resource.robot

*** Test Case ***
Cenario: criando email por argumentos
    Dado que eu recebo o nome "bruno" sobrenome "oliveira" e a idade "28"
    Quando monto o meu email
    Então imprimo o mu novo email
