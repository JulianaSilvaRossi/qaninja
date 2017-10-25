#language: pt

Funcionalidade: Login
Sendo um usuário do Invoices
Posso acessar o sistema
Para poder cadastrar clientes e faturas

    Contexto: Página login
    * Usuário acessa página login

    @logout @smoke
    Cenário: Administrador faz login

        Dado que tenho os seguintes dados de acesso:
        |email|admin-qa@invoices.com|
        |senha|secret|
        Quando faço login
        Então vejo o Dashboard com a mensagem "Olá, Invoices, seja bem vindo ao Invoices."
            E vejo o email do usuário logado

    #Cenário Expressivo na Mão - Para corrigir problema de refresh

    @tentativas
    Cenário: Tentativa de login

        Dado que eu tenho os seguintes dados:
      | email                 | senha  | mensagem                 |
      | admin-qa@invoices.com | 123456 | Senha inválida.          |
      | admin-qa&invoices.com | 123456 | Informe um email válido. |
      | admin-qa@gmail.com    | 123456 | Usuário não cadastrado.  |
        Quando faço a tentativa de login
        Então vejo a mensagem de erro de login

    # Exemplo Cenário Expressivo
    # @tentativas
    # Esquema do Cenário: Tentativas de Login

    #     Dado que tenho um <email> e <senha>
    #     Quando faço login
    #     Então vejo a <mensagem> de alerta

    # Exemplos:
    #   | email                   | senha    | mensagem                   |
    #   | "admin-qa@invoices.com" | "123456" | "Senha inválida."          |
    #   | "admin-qa&invoices.com" | "123456" | "Informe um email válido." |
    #   | "admin-qa@gmail.com"    | "123456" | "Usuário não cadastrado."  |

    # Exemplo passando parametro
    # @invalida
    # Cenário: Senha inválida

    #     Dado que tenho "admin-qa@invoices.com" e "123456"
    #     Quando faço login
    #     Então vejo a "Senha inválida." de alerta

    # Exemplo reaproveitamento código
    # @invalida
    # Cenário: Senha inválida

    #     Dado que tenho os seguintes dados de acesso:
    #     |email|admin-qa@invoices.com|
    #     |senha|123456|
    #     Quando faço login
    #     Então vejo a mensagem de alerta "Senha inválida."

    # @incorreto
    # Cenário: Email incorreto

    #     Dado que tenho os seguintes dados de acesso:
    #     |email|admin-qa&invoices.com|
    #     |senha|123456|
    #     Quando faço login
    #     Então vejo a mensagem de alerta "Informe um email válido."

    # @no_cadastrado
    # Cenário: Usuário não cadastrado

    #     Dado que tenho os seguintes dados de acesso:
    #     |email|admin-qa@gmail.com|
    #     |senha|123456|
    #     Quando faço login
    #     Então vejo a mensagem de alerta "Usuário não cadastrado."