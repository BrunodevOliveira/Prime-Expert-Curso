*** Settings ***
Documentation    arquivo responsavel pelas importacoes, variaveis e keywords
Library          SeleniumLibrary
Library          String


*** Variable ***
${url}                 http://automationpractice.com/index.php
&{Home}                campo_de_busca=css:#search_query_top
...                    icone_de_busca=//input[@id="search_query_top"]/following-sibling::button[@type='submit']
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
    Wait Until Element Is Visible    //*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be           //*[@id="center_column"]/p[@class='alert alert-warning']    ${Mensagem}

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


Clicar em "Sign in"
    Wait Until Element Is Visible     //*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]
    Click Element                     //*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]

Informar um e-mail válido
    Wait Until Element Is Visible   id=email_create
    ${Email}                        Generate Random String
    Input Text                      id=email_create      ${Email}@gmail.com

Clicar em "Create an account"
    Click Button    id=SubmitCreate

Preencher os dados obrigatórios
    #                   Cadastro de Pessoa
    Wait Until Element Is Visible        //h3[@class='page-subheading'][contains(.,'Your personal information')]
    Click Element                        //*[@id="id_gender1"]  
    Input Text                           //*[@id="customer_firstname"]     ${Pessoa.nome}
    Input Text                           //input[@id='customer_lastname']  ${Pessoa.sobrenome}
    Input Text                           //input[@id='passwd']             ${Pessoa.pwd}
    
    #                   Cadastro de Endereço
    Input Text                           //input[@id='address1']           ${Pessoa.endereco}
    Input Text                           //input[@id='city']               ${Pessoa.cidade}
    Set Focus To Element                 //select[@id='id_state']
    Click Element                        //*[@id="id_state"]/option[contains(., '${Pessoa.nome_estado}')]       
    Input Text                           //input[@id='postcode']            ${Pessoa.cep}
    Input Text                           //input[@id='phone_mobile']        ${Pessoa.telefone}
    Input Text                           //input[@id='alias']               ${Pessoa.referencia}  

Submeter cadastro
    Click Button                         //*[@id="submitAccount"]

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible       //*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Element Text Should Be              //*[@id="center_column"]/p
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
