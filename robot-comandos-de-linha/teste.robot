*** Test Case ***
Cenario: entenendo como robot funciona por linha de comando
    [tags]  chamando_robot
    Log To Console  \n\n Ola pessoal ad Turma 4\n

Cenario: recebendo um valor pelo terminal
    [Tags]  recebendo_valor
    Log To Console  \n\n Olá ${valor_do_terminal}!!!!\n
    #Declaro a variável aqui e atribuo um valor a ela na linha de comando