*** Settings ***
Library    SeleniumLibrary

*** Variables ***



#Variables de configuração
${URL}         https://www.saucedemo.com/ 
${Browser}     chrome
${UserValido}  standard_user
${PassWordValido}  secret_sauce
${UserInvalido}    standard_false
${PasswordInvalido}  secret_invalid

#Elementos
${Username}    css=#user-name
${Password}    css=#password
${Login}       css=#login-button
${head}      xpath=//*[@class='app_logo']



*** Keywords ***
Dado que eu acesse o site
    Open Browser   ${URL}    ${Browser} 

Quando preencher os dados do usuario valido
    Input Text    ${Username}   ${UserValido}
    Input Text    ${Password}   ${PassWordValido}

preencher usuario invalido
    Input Text    ${Username}   ${UserInvalido} 
    Input Text    ${Password}   ${PasswordInvalido}
    
E clicar em login
    Click Element  ${Login} 

Então realizo o login com sucesso
    Element Should Be Visible   ${head}

*** Test Cases ****
Cenário 1: Realizar Login com sucesso
    Dado que eu acesse o site
    Quando preencher os dados do usuario valido
    E clicar em login
    Então realizo o login com sucesso


   