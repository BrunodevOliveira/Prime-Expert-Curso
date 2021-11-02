*** Settings ***
Documentation    arquivo responsavel pelas importacoes, variaveis e keywords
Library          SeleniumLibrary
Library          String


*** Variable ***
${url}                 http://automationpractice.com/index.php


*** Keywords ***
Acessar a página home do site Automation Practice
    Open Browser    ${url}      chrome

Passar o mouse por cima da categoria "${Categoria}" no menu principal superior de categorias
    Wait Until Element Is Visible    //*[@id="block_top_menu"]//a[@title="${Categoria}"]
    Mouse Over                       //*[@id="block_top_menu"]//a[@title="${Categoria}"]  

Clicar na sub categoria "${Subcategoria}"
    Wait Until Element Is Visible    //div[@id="block_top_menu"]//a[@title="${Subcategoria}"]
    Click Element                    //div[@id="block_top_menu"]//a[@title="${Subcategoria}"]

Conferir se os produtos da sub-categoria "${Subcategoria}" forma mostrados na página
    Page Should Contain Element      //span[@class='cat-name'][contains(., '${Subcategoria}')]
    Page Should Contain Element      //div[@class='product-container']//h5//a[@title="Printed Summer Dress"]
    Page Should Contain Element      //div[@class='product-container']//h5//a[@title='Printed Chiffon Dress']
    Close Browser