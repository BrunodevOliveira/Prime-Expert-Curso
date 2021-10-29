*** Variable ***
@{lista_pais}   frança  Africa  Japão   Europa  USA

*** Keywords ***
#Nesse exercicio usamos a abordagem de argumentos embutidos, então desdde que eu passe algum argumento dentro da frase da KeyWord ele vai extrair esse dado e colocar como variável na execucao
contando de "${num_init}" ate "${num_final}"
    FOR     ${num}  IN  RANGE   ${num_init} ${num_final}
        Log To Console  \n estou no numero: ${num}\n
    END

contando em que pais viajamos
    FOR ${pais}     IN  @{lista_pais}
        Log To Console  \n Viajamos por ${pais} \n
    END