*** Settings ***
Library     Collections

*** Variables ***
&{pessoa}   nome=bruno    sobrenome=Oliveira    idade= 28   estado=RJ altura= 1.66    hobby=games
    
@{frutas}   Banana  Manga   Morango     Maca     Uva

***Keywords***
imprimir pessoa
    Log To Console  \n\nImprimindo pessoa: ${pessoa}\n

criando meu dicionario
    &{criando_pessoa}  Create Dictionary   nome=Bruno  sobrenome=Oliveira  idade=28 estado=RJ  altura=1.66  hobby=games
    Set Test Variable   &{criando_pessoa}   

imprimir este dicionario
    Log To Console  \n\nImprimindo pessoa:&{criando_pessoa}\n  

imprimir lista de frutas
    Log To Console   \n\nImprimindo lista de frutas:@{frutas}\n 

