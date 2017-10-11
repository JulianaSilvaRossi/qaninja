#language: pt

Funcionalidade: Soma de Valores
    Sendo um usuário da calculadora
    Posso fazer operações matemáticas
    Para poder ajudar minha vida

    # Cenário: Soma de 2 + 3

    #     Quando faço a soma de 2 + 3
    #     Então o resultado deve ser 5
    
    # Cenário Expressivo
    # Palavra reservada => Esquema do Cenário
    # Placeholder => as variaveis que representam os valores
    # Matrix de exemplos => de massa de testes

    Esquema do Cenário: Soma de Valores

        Quando faço a soma de <v1> + <v2>
        Então o resultado deve ser <v3>

    Exemplos:
      | v1 | v2 | v3  |
      | 2  | 3  | 5   |
      | 3  | 3  | 6   |
      | 2  | 2  | 4   |
      | 7  | 7  | 14  |
