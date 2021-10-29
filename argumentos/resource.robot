*** Variable ***
${nome_mail}
${sobrenome_email}
${idade_email}
${prefixo_email}    @robot.com
${email_pronto}


*** Keywords ***
Dado que eu recebo o nome "${nome}" sobrenome "${sobrenome}" e a idade "${idade}"
   Set Test Variable   ${nome_email}        ${nome}
   Set Test Variable   ${sobrenome_email}   ${sobrenome}
   Set Test Variable   ${idade_email}       ${idade}   

Quando monto o meu email
    ${email}     Catenate  ${nome_email}  ${sobrenome_email}  ${idade_email}  ${prefixo_email}
    Set Test Variable  ${email_pronto}   ${email}
Então imprimo o um novo email
    Log To Console  \n\n Bemm vindo ao mundo Robot, este é seu novo e-mail: ${email_pronto}