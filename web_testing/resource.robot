*** Settings ***
Documentation    arquivo responsavel pelas importacoes, variaveis e keywords
Library          SeleniumLibrary
Library          String


*** Variable ***
${url}      http://automationpractice.com/index.php
&{Home}         campo_de_busca=css:#search_query_top
...             icone_de_busca=//input[@id="search_query_top"]/following-sibling::button[@type='submit']
&{PESSOA}              nome=Bruno    sobrenome=Oliveira    pwd=123456
...                    endereco=Rua Botafogo, Bairro Chique    cidade=Rio de janeiro
...                    nome_estado=California  cep=55555  telefone=98765432  referencia=Metro
 

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
    ${Email}                        Generate Random String
    Input Text                      id=email_create      ${Email}@gmail.com

Clicar em "Create an account"
    Click Button    id=SubmitCreate

Preencher os dados obrigatórios
    Wait Until Element Is Visible       xpath=//h3[@class='page-subheading'][contains(.,'Your personal information')]
    Click Element                       xpath=//*[@id="id_gender1"]  
    Input Text                          xpath=//*[@id="customer_firstname"]     ${Pessoa.nome}
    Input Text                          xpath=//input[@id='customer_lastname']  ${Pessoa.sobrenome}
    Input Text                          xpath=//input[@id='passwd']             ${Pessoa.pwd}
    Input Text                          xpath=//input[@id='address1']           ${Pessoa.endereco}
    Input Text                          xpath=//input[@id='city']               ${Pessoa.cidade}
    Set Focus To Element                xpath=//select[@id='id_state']
    Click Element                       xpath=//*[@id="id_state"]/option[contains(., '${Pessoa.nome_estado}')]       
    Input Text                          xpath=//input[@id='postcode']            ${Pessoa.cep}
    Input Text                          xpath=//input[@id='phone_mobile']        ${Pessoa.telefone}
    Input Text                          xpath=//input[@id='alias']               ${Pessoa.referencia}  

Submeter cadastro
    Click Button                        xpath=//*[@id="submitAccount"]

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible      xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Element Text Should Be             xpath=//*[@id="center_column"]/p
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
