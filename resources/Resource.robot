*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${URL}                    http://automationpractice.com/index.php
${PAGE_LOGIN}             ${URL}?controller=authentication&back=my-account
${BROWSER}                Google Chrome
${EMAIL}                  evertondutra02@gmail.com
${PASSWORD}               123456


*** Keywords ***
Abrir Navegador
    Open Browser        ${URL}      ${BROWSER}      

Fechar Navegador    
    Close Browser

Acessar a pagina login 
    Go to      ${PAGE_LOGIN}

Inserir Email
    Input Text    id:email    ${EMAIL}

Inserir Password
    Input Text    id:passwd    ${PASSWORD}

Clicar Botão Sign In
    Click Button    id:SubmitLogin

Conferir se a conta esta logada
    Wait Until Element Is Visible        class:account
    ${ELEMENT}=                          get webelement              class:account
    Should Be Equal                      ${ELEMENT.text}             Everton Dutra
    Element Text Should Be               class:page-heading          MY ACCOUNT

Conferir msg de Erro
    Wait Until Element Is Visible        css:div.alert ol
    Element Text Should Be               css:div.alert ol           An email address required.
    Element Text Should Be               css:div.alert p            There is 1 error

