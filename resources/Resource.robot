*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${URL}                    http://automationpractice.com/index.php
${PAGE_LOGIN}             ${URL}?controller=authentication&back=my-account
${BROWSER}                Google Chrome

*** Keywords ***
Abrir Navegador
    Open Browser        ${URL}      ${BROWSER}      

Fechar Navegador    
    Capture Page Screenshot
    Close Browser

Acessar a pagina login 
    Go to      ${PAGE_LOGIN}

Inserir Email
    [Arguments]        ${EMAIL}
    Input Text    id:email    ${EMAIL}

Inserir Senha
    [Arguments]    ${SENHA}
    Input Text     id:passwd    ${SENHA}

Clicar Botão Sign In
    Click Button    id:SubmitLogin

Conferir se a conta esta logada
    Wait Until Element Is Visible        class:account
    ${ELEMENT}=                          get webelement              class:account
    Should Be Equal                      ${ELEMENT.text}             Everton Dutra
    Element Text Should Be               class:page-heading          MY ACCOUNT

Conferir msg de Erro
    [Arguments]        ${MSG}
    Wait Until Element Is Visible        css:div.alert ol
    Element Text Should Be               css:div.alert ol           ${MSG}
    Element Text Should Be               css:div.alert p            There is 1 error
    Element Should Be Visible            id:SubmitCreate 
