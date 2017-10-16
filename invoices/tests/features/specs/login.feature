#language: pt

Funcionalidade: Login
Sendo um usuário do Invoices
Posso acessar o sistema
Para poder cadastrar clientes e faturas

    Cenário: Administrador faz login

        Dado que tenho os seguintes dados de acesso:
        |email|admin-qa@invoices.com|
        |senha|secret|
        Quando faço login
        Então vejo o Dashboard com a mensagem "Olá, Invoices, seja bem vindo ao Invoices."

    @invalida
    Cenário: Senha inválida

        Dado que tenho os seguintes dados de acesso:
        |email|admin-qa@invoices.com|
        |senha|123456|
        Quando faço login
        Então vejo a mensagem de alerta "Senha inválida."

    @incorreto
    Cenário: Email incorreto

        Dado que tenho os seguintes dados de acesso:
        |email|admin-qa&invoices.com|
        |senha|123456|
        Quando faço login
        Então vejo a mensagem de alerta "Informe um email válido."

    @no_cadastrado
    Cenário: Usuário não cadastrado

        Dado que tenho os seguintes dados de acesso:
        |email|admin-qa@gmail.com|
        |senha|123456|
        Quando faço login
        Então vejo a mensagem de alerta "Usuário não cadastrado."