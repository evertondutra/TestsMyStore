 # language: pt

 Funcionalidade: efetuar login no site http://automationpractice.com

    Como usuário com conta registrada, efetuar login para escolher itens

    Cenário: Login com sucesso
        Dado que esteja na página de login
        Quando inserir o email e senha
        Então devo logar e estar na página da conta

    Cenário: Login sem sucesso: sem informar o email
        Dado que esteja na página de login
        Quando inserir somente a senha
        Então não deve logar e mostrar mensagem de erro

    Cenário: Login sem sucesso: informar o email inválido
        Dado que esteja na página de login
        Quando inserir o email e senha
        Então não deve logar e mostrar mensagem de erro

    Cenário: Login sem sucesso: informar no email somente números
        Dado que esteja na página de login
        Quando Quando inserir o email e senha
        Então não deve logar e mostrar mensagem de erro

    Cenário: Login sem sucesso: informar no email somente caracteres
        Dado que esteja na página de login
        Quando inserir somente caracteres no campo email e senha
        Então deve mostrar mensagem email inválido

    Cenário: Login sem sucesso: sem informar o senha
        Dado que esteja na página de login
        Quando inserir somente o email
        Então deve mostrar mensagem da falta da 
        
    Cenário: Login sem sucesso: informar o senha inválido
        Dado que esteja na página de login
        Quando inserir o email e senha inválida
        Então deve mostrar mensagem de login inválido

    Cenário: Login sem sucesso: informar o senha incompleta
        Dado que esteja na página de login
        Quando inserir o email e a senha incompleta
        Então deve mostrar mensagem de login inválido