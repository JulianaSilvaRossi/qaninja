#language: pt

Funcionalidade: Exclusão de clientes
    Sendo um usuário cadastrado
    Posso acessar o cadastro de clientes
    Para poder remover meus clientes

    Contexto: Cadastrar cliente
    * Usuário faz login
    * Usuário acessa cadastro de clientes

    @remover @logout
    Cenário: Remover clientes

        Dado que tenho um cliente cadastrado
        Quando solicito a exclusão desse cliente
            E confirmo a exclusão
        Então esse cliente não deve ser exibido na busca
            E vejo uma mensagem informando que este cliente não está cadastrado