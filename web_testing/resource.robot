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

Passar o mouse por cima da categoria "${Categoria}" no menu principal superior de categorias
    Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]//a[@title="${Categoria}"]
    Mouse Over                      xpath=//*[@id="block_top_menu"]//a[@title="${Categoria}"]  

Clicar na sub categoria "${Subcategoria}"
    Wait Until Element Is Visible   xpath=//div[@id="block_top_menu"]//a[@title="${Subcategoria}"]
    Click Element                   xpath=//div[@id="block_top_menu"]//a[@title="${Subcategoria}"]

    # Conferir se os produtos da sub-categoria "${Subcategoria}" forma mostrados na página
    #     Wait Until Element Is Visible     xpath=//div[contains(@class,'content_scene_cat_bg')]
    # xpath=//div[@id='center_column']/ul[@class='product_list']

Clicar em "Sign in"
    Wait Until Element Is Visible    xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]
    Click Element    xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]

Informar um e-mail válido
    Wait Until Element Is Visible   id=email_create
    Input Text       id=email_create      prime_test_bruno@gmail.com

Clicar em "Create an account"
    Click Button    id=SubmitCreate

Preencher os dados obrigatórios
    Wait Until Element Is Visible   xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
    Click Element                   id="uniform-id_gender1"   
    Input Text                      id="customer_firstname"
    Input Text                      id="customer_lastname"
    Input Text                      id="passwd"
    Input Text                      id="company"
    Input Text                      id=address1
    Input Text                      id="city"
    Set Focus To Element            id=id_state
    Select From List By Index       id=id_state          
    Input Text                      id=postcode
    Input Text                      id=phone_mobile