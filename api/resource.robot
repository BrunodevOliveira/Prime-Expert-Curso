*** Settings ***
Library     RequestsLibrary

*** Variable ***
${url}              https://gorest.co.in/
${recursos}         /public
${end_point}        /v1/users
&{Headers}          Accept=application/json     Content-Type:application/json
${resposta}

*** Keywords ***
Criar uma requisição GET para lista de usuarios 
    ${url_completa}     Catenate  ${url}${recursos}${end_point}
    ${resposta_get}=     GET     url=${url_completa}     headers=${Headers}  
    Set Test Variable  ${resposta}  ${resposta_get.json()}  

Imprimir a lista de usuarios
    Log To Console  \n\n${resposta}\n\n

# curl -i -H "Accept:application/json" -H "Content-Type:application/json" -XGET "https://gorest.co.in/public/v1/users"