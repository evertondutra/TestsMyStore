*** Settings ***
Resource    ../resources/Resource.robot

Test Setup          Abrir Navegador
Test Teardown       Fechar Navegador

*** Variables ***

*** Test Cases ***
Cenário: Login com sucesso
    Dado que esteja na página de login
    Quando inserir o email e senha
    Então devo logar e estar na página da conta

Cenário: Login sem sucesso: sem informar o email
    [tags]        errorr
    Dado que esteja na página de login
    Quando inserir somente a senha
    Então deve mostrar mensagem da falta do email


*** Keywords ***
Dado que esteja na página de login
    Acessar a pagina login

Quando inserir o email e senha
    Inserir Email
    Inserir Password
    Clicar Botão Sign In

Então devo logar e estar na página da conta
    Conferir se a conta esta logada

Quando inserir somente a senha
    Inserir Password
    Clicar Botão Sign In

Então deve mostrar mensagem da falta do email
    Conferir msg de Erro