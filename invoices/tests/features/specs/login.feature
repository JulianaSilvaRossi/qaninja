#language: pt

Funcionalidade: Login
Sendo um usuário do Invoices
Posso acessar o sistema
Para poder cadastrar clientes e faturas

    Contexto: Página login
    * Usuário acessa página login

    @logout @smoke
    Cenário: Administrador faz login

        Dado que eu tenho um usuário com perfil "Admin"
        Quando faço login
        Então vejo o Dashboard com a mensagem "Olá, "Invoices", seja bem vindo ao Invoices."
            E vejo o email do usuário logado

    @tentativas
    Cenário: Tentativa de login

        Dado que eu tenho os seguintes dados:
            | email                 | senha  | mensagem                 |
            | admin-qa@invoices.com | 123456 | Senha inválida.          |
            | admin-qa&invoices.com | 123456 | Informe um email válido. |
            | admin-qa@gmail.com    | 123456 | Usuário não cadastrado.  |
        Quando faço a tentativa de login
        Então vejo a mensagem de erro de login