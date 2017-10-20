#language: pt

Funcionalidade: Cadastrar clientes
    Sendo um usuário logado no sistema
    Posso acessar o cadastro de clientes
    Para cadastrar os novos clientes e poder adm os mesmos

    Contexto: Acessa cadastro de clientes
    * Usuário acessa cadastro de clientes

    @cadastro @login_adm
    Cenário: Cadastrar novo cliente

        Dado que eu tenho um cliente "Prime"
        # Dado que tenho um novo cliente com os seguintes atributos:
        #     | name   | Juliana S Rossi     |
        #     | phone  | 11912345678         |
        #     | email  | julianas@gmail.com  |
        #     | gender | M                   |
        #     | type   | Prime               |
        #     | note   | Lorem ipsum         |
        #     | info   | true                |
        Quando faço o cadastro desse cliente
        Então este cliente deve ser exibido na busca