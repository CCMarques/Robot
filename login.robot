*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Username}    css=#user-name
${Password}    css=#password
${Login}       css=#login-button


*** Keywords ***
abrir navegador e acessar o site
    Open Browser  https://www.saucedemo.com/  chrome

preencher usuario valido
    Input Text    ${Username}   standard_user
    Input Text    ${Password}   secret_sauce

preencher usuario invalido
    Input Text    ${Username}   standard_false
    Input Text    ${Password}   secret_invalid
    
clicar em login
    Click Element  ${Login} 


*** Test Cases ****
Cenário 1: Realizar Login com sucesso
    abrir navegador e acessar o site
    preencher usuario valido
    clicar em login

Cenário 2: Realizar Login sem sucesso
    abrir navegador e acessar o site
    preencher usuario invalido
    clicar em login

   