#language: pt

Funcionalidade: Cadastrar clientes
    Sendo um usuário logado no sistema
    Posso acessar o cadastro de clientes
    Para cadastrar os novos clientes e poder adm os mesmos

    Contexto: Acessa cadastro de clientes
        * Usuário acessa cadastro de clientes

    @cadastro @login_adm @smoke @logout
    Cenário: Cadastrar novo cliente

        Dado que eu tenho um novo cliente 
        Quando faço o cadastro desse cliente
        Então este cliente deve ser exibido na busca

    @cadastro_tipos @login_adm @logout
    Esquema do Cenário: Cadastrar cliente por tipo

        Dado que eu tenho um novo cliente
            E esse cliente é do <"tipo">
        Quando faço o cadastro desse cliente
        Então este cliente deve ser exibido na busca

        Exemplos:
            | "tipo"     |
            | "Prime"    |
            | "Gold"     |
            | "Platinum" |