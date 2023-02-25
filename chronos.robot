*** Settings ***
Documentation    Robot Framework sem complicação
Library          SeleniumLibrary    timeout=10000
Library          String             

*** Test Cases ***
ChronosTest
    Open Browser        ${url}    ${browser}
    Maximize Browser Window    
    Adicionar item no carrinho de compra
    Acessar carrinho de compras
    Checkout
    Mensagem de confirmação de compra             

*** Variables ***
${url}        https://www.demoblaze.com/
${browser}    chrome
${time}       3s

*** Comments ***

*** Keywords ***
Adicionar item no carrinho de compra
    Click Link          Phones
    Wait Until Element Is Visible    link=Samsung galaxy s6
    Click Link          Samsung galaxy s6

    Wait Until Element Is Visible    xpath=//div[2]/div/a
    Click Element       xpath=//div[2]/div/a
    Alert Should Be Present

Acessar carrinho de compras
    Wait Until Element Is Visible    link=Cart
    Click Link          Cart 
    
    Wait Until Element Is Visible    css=.btn-success
    Click Element       css=.btn-success
    Sleep               ${time}

Checkout
    Wait Until Element Is Visible        xpath=//h5[contains(text(), 'Place order')]

    Click Element       id=name
    Input Text          id=name          Jubileu da Silva Xablau

    Click Element       css=#country
    Input Text          css=#country     Brasil

    Click Element       css=#city
    Input Text          css=#city        Fortaleza

    Click Element       css=#card
    Input Text          css=#card        12345678912345678912

    Click Element       css=#month
    Input Text          css=#month       10

    Click Element       css=#year
    Input Text          css=#year        25
    
    Sleep               ${time}

Mensagem de confirmação de compra
    Click Element       xpath=//div[3]/div/div/div[3]/button[2]

    Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Thank you for your purchase!')]

    Sleep               ${time}  

    Click Element       xpath=//div[7]/div/button

    Sleep               ${time} 
