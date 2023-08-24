*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Username}    css=#user-name
${Password}    css=#password
${Login}       css=#login-button

#Produtos
${Bag}         CSS=#add-to-cart-sauce-labs-backpack
${coat}        CSS=#add-to-cart-sauce-labs-fleece-jacket
${T-Shirt}     CSS=#add-to-cart-sauce-labs-bolt-t-shirt
${Bike}        CSS=#add-to-cart-sauce-labs-bike-light

#Elementos 
${Carrinho}    css=#shopping_cart_container > a
${checkout}    css=#checkout
${first-name}  css=#first-name
${last-name}     css=#last-name
${postal-code}   css=#postal-code
${continue}     css=#continue
${valorTotal}    css=#checkout_summary_container > div > div.summary_info > div.summary_info_label.summary_total_label
${finalizarCompra}    css=#finish
${compraFinalizada}    css=#checkout_complete_container > h2



*** Keywords ***
abrir navegador e acessar o site
    Open Browser  https://www.saucedemo.com/  chrome

realizar login
    Input Text    ${Username}   standard_user
    Input Text    ${Password}   secret_sauce
    Click Element  ${Login} 

realizar compras
    Click Element   ${Bag}  
    Click Element   ${T-Shirt}   
    Click Element   ${coat}  
    Click Element   ${Bike}


confirmar checkout
    Click Element    ${Carrinho}  
    Click Element    ${checkout} 

realizar cadastro
    Input Text    ${first-name}   First Name
    Input Text    ${last-name}    Last Name
    Input Text    ${postal-code}  24082023
    Click Element  ${continue} 

validar valor total
    Element Should Be Visible   ${valorTotal} 
    Click Element    ${finalizarCompra}

checkout completo    
    Element Should Be Visible  ${compraFinalizada} 


*** Test Cases ****
Cenário 1: Realizar Login com sucesso
    abrir navegador e acessar o site
    realizar login
    realizar compras
    confirmar checkout
    realizar cadastro
    validar valor total
    checkout completo

    


        
    