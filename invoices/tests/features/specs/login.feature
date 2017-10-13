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