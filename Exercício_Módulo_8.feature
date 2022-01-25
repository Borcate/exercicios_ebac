#language: pt

|[US-0001] – Configurar produto   |

Funcionalidade: Configurar produto 
Como cliente da EBAC-SHOP
Quero configurar meu produto de acordo com meu tamanho e gosto
E escolher a quantidade
Para depois inserir no carrinho

|1 – Seleções de cor, tamanho e quantidade devem ser obrigatórios|

Cenário: Selecionar cor, tamanho e quantidade 
Dado que seleções de cor, tamanho e quantidade devem ser obrigatórios 
Quando eu clicar em comprar
Então deve ser inserido no carrinho 

Cenário: Selecionar cor e tamanho 
Dado que seleções de cor, tamanho e quantidade devem ser obrigatórios 
Quando eu clicar em comprar
Então deve ser exibido "campo quantidade é obrigatório"

Cenário: Selecionar cor e quantidade 
Dado que seleções de cor, tamanho e quantidade devem ser obrigatórios 
Quando eu clicar em comprar
Então deve ser exibido "campo tamanho é obrigatório"

Cenário: Selecionar tamanho e quantidade 
Dado que seleções de cor, tamanho e quantidade devem ser obrigatórios 
Quando eu clicar em comprar
Então deve ser exibido "campo cor é obrigatório"

Cenário: Não selecionar cor, tamanho e quantidade
Dado que seleções de cor, tamanho e quantidade devem ser obrigatórios 
Quando eu clicar em comprar
Então deve ser deve ser exibido "campo cor, tamanho e quantidade são obrigatórios"

|2 – Deve permitir apenas 10 produtos por venda|

Contexto: Deve permitir apenas 10 produtos por venda

Cenário: Inserir  9 produtos 
Quando clicar em comprar 
Então deve permitir inserir no carrinho

Cenário: Inserir  10 produtos 
Quando clicar em comprar 
Então deve permitir inserir no carrinho

Cenário: Inserir  11 produtos 
Quando clicar em comprar 
Então não deve permitir inserir no carrinho, exibir mensagem de "Permitido 10 produtos por vez"

|3 –Quando eu clicar no botão “limpar” deve voltar ao estado original|

Contexto: Quando eu clicar no botão “limpar” deve voltar ao estado original

Cenário: Inserir cor, tamanho e quantidade 
Quando clicar em limpar 
Então não deve exibir as informações selecionadas anteriormente 

Cenário: Inserir cor, tamanho e quantidade 
Quando não clicar em limpar 
Então deve manter as informações selecionadas  


|[US-0002] – Login na plataforma |

Funcionalidade: Como cliente da EBAC-SHOP
Quero fazer o login (autenticação) na plataforma  
Para visualizar meus pedidos

|1 – Ao inserir dados válidos deve ser direcionado para a tela de checkout|

Esquema do Cenário: Inserir dados válidos
Dado que eu faça login de autenticação  na plataforma
Quando eu inserir <e-mail> válido
E uma <senha> válida
Então o sistema deve direcionar para a tela de checkout

            | E-mail              | Senha |
            | ana@teste.com.br    | 123@  |
            | jose@teste.com.br   | 456@  |
            | marcos@teste.com.br | 789@  |
            | pedro@teste.com.br  | 147@  |


|2 – Ao inserir um dos campos inválidos deve exibir uma mensagem de alerta “Usuário ou senha inválidos”|

Esquema do Cenário: Inserir dados inválidos
Dado que eu faça login de autenticação  na plataforma
Quando eu inserir <e-mail> inválido
E uma <senha> válida
Então o sistema deve exibir mensagem de alerta “Usuário ou senha inválidos”

Exemplos: 
            | E-mail                    | Senha | Mensagem                     |
            | anaabc@teste.com.br       | 123@  | “Usuário ou senha inválidos” |
            | jose123@teste.com.br      | 456@  | “Usuário ou senha inválidos” |
            | marcosalves@teste.com.br  | 789@  | “Usuário ou senha inválidos” |
            | barbosapedro@teste.com.br | 147@  | “Usuário ou senha inválidos” |


Esquema do Cenário: Inserir dados inválidos
Dado que eu faça login de autenticação  na plataforma
Quando eu inserir <e-mail> válido
E uma <senha> inválida
Então o sistema deve exibir mensagem de alerta “Usuário ou senha inválidos”

Exemplos:
            | E-mail              | Senha  | Mensagem                     |
            | ana@teste.com.br    | abc@   | “Usuário ou senha inválidos” |
            | jose@teste.com.br   | XZY@   | “Usuário ou senha inválidos” |
            | marcos@teste.com.br | 123#   | “Usuário ou senha inválidos” |
            | pedro@teste.com.br  | 147##* | “Usuário ou senha inválidos” |

            

| [US-0003] – Tela de cadastro - Checkout |

Funcionalidade: Como cliente da EBAC-SHOP
Quero fazer concluir meu cadastro
Para finalizar minha compra

| 1 – Deve ser cadastrado com todos os dados obrigatórios, marcado com asteriscos |

Cenário: Campos obrigatórios preenchidos
Dado que todos os dados obrigatório devem estar preenchidos
Quando eu clicar em finalizar compra
Então deve concluir cadastro com sucesso

Cenário: Campos obrigatórios não preenchidos
Dado que todos os dados obrigatório devem estar preenchidos
Quando eu clicar em finalizar compra
Então deve exibir mensagem de campos obrigatórios


| 2 – Não deve permitir campo e-mail com formato inválido. Sistema deve inserir uma mensagem de erro |

Esquema do Cenário: Autenticar campo e-mail com formato inválido
Dado que eu insira um e-mail inválido
Quando eu digitar o <e-mail>
Então deve exibir <mensagem> de erro

Exemplos:

            | E-mail                 | Mensagem          |
            | "teste123.com"         | "E-mail inválido" |
            | "teste."               | "E-mail inválido" |
            | "."                    | "E-mail inválido" |
            | "José.Ação.@teste.com" | "E-mail inválido" |


| 3 – Ao tentar cadastrar com campos vazios, deve exibir mensagem de alerta. |

Cenário: Não preencher nenhum dos campos do checkout
Dado que eu não preencha nenhum os campos do checkout
Quando eu clicar em finalizar compra
Então o sistema deve exibir mensagem de alerta, 'Campos obrigatórios devem estar preenchidos!'

Cenário: Não preencher 1 dos campos obrigatórios
Dado eu não preencha todos campos do checkout
Quando eu clicar em finalizar compra
Então o sistema deve exibir mensagem de alerta, 'Campos obrigatórios devem estar preenchidos!'
