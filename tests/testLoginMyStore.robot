*** Settings ***
Resource    ../resources/Resource.robot

Test Setup          Abrir Navegador
Test Teardown       Fechar Navegador

*** Variables ***

*** Test Cases ***
Cenário: Login com sucesso
    [Tags]        CENARIO_1
    Dado que esteja na página de login
    Quando inserir o email e senha        evertondutra02@gmail.com        123456
    Então devo logar e estar na página da conta

Cenário: Login sem sucesso: sem informar o email
    [tags]        CENARIO_2
    Dado que esteja na página de login
    Quando inserir somente a senha             123456
    não deve logar e mostrar mensagem de erro        An email address required.


Cenário: Login sem sucesso: informar o email inválido
    [Tags]        CENARIO_3
    Dado que esteja na página de login
    Quando inserir o email e senha            eduardo02@gmail.com        123456
    não deve logar e mostrar mensagem de erro       Authentication failed.

*** Keywords ***
Dado que esteja na página de login
    Acessar a pagina login

Quando inserir o email e senha
    [Arguments]          ${EMAIL}         ${SENHA}
    Inserir Email        ${EMAIL}
    Inserir Senha        ${SENHA}
    Clicar Botão Sign In

Então devo logar e estar na página da conta
    Conferir se a conta esta logada

Quando inserir somente a senha
    [Arguments]              ${SENHA}
    Inserir Senha            ${SENHA}
    Clicar Botão Sign In

não deve logar e mostrar mensagem de erro
    [Arguments]                 ${MSG}
    Conferir msg de Erro        ${MSG}

