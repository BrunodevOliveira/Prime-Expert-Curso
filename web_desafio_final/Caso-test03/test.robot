*** Settings ***
Resource    resource.robot

*** Test Case ***
Caso de Teste 03: Lista de produtos
    Acessar a página home do site Automation Practice
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" forma mostrados na página