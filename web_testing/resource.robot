*** Settings ***
Documentation    arquivo responsavel pelas importacoes, variaveis e keywords
Library     SeleniumLibrary


*** Variable ***
${url}      http://automationpractice.com/index.php
&{Home}         campo_de_busca=css:#search_query_top
...             icone_de_busca=//input[@id="search_query_top"]/following-sibling::button[@type='submit']
   

*** Keywords ***
Acessar a página home do site Automation Practice
    Open Browser    ${url}      chrome

Digitar o nome do produto "${produto}" no campo de pesquisa
    Wait Until Element Is Visible      ${Home.campo_de_busca}
    Input Text                         ${Home.campo_de_busca}   ${produto}

Clicar no botão pesquisar
    Wait Until Element Is Visible      ${Home.campo_de_busca}
    Click Element                      ${Home.icone_de_busca}

Conferir mensagem "${Mensagem}"   
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${Mensagem}

    