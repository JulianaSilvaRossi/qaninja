#language: pt

Funcionalidade: Cadastrar clientes
    Sendo um usuário logado no sistema
    Posso acessar o cadastro de clientes
    Para cadastrar os novos clientes e poder adm os mesmos

    @cadastro
    Cenário: Cadastrar novo cliente

        Dado que tenho um novo cliente com os seguintes atributos:
            | name   | Juliana Rossi     |
            | phone  | 11912345678       |
            | email  | juliana@gmail.com |
            | gender | M                 |
            | type   | Prime             |
            | note   | Lorem ipsum       |
        Quando faço o cadastro desse cliente
        Então este cliente deve ser exibido na busca