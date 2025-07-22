Cenário: Usuário avalia sua própria reserva
Given uma reserva APROVADA para o equipamento "Projetor da Sala 1" feita pelo usuário "aluno.experiente@email.com" com data passada existe
And estou autenticado como o usuário "aluno.experiente@email.com"
When eu envio uma requisição POST para avaliar a reserva com nota "5" e comentário "Projetor com ótima imagem e brilho."
Then a resposta deve ter o status 201
And recebo uma mensagem de sucesso

Cenário: Tentar avaliar uma reserva que ainda não terminou
Given uma reserva APROVADA para o equipamento "Projetor da Sala 1" feita pelo "aluno.experiente@email.com" que termina AMANHÃ existe
And estou autenticado como o usuário "aluno.experiente@email.com"
When eu envio uma requisição POST para avaliar a reserva com nota "4" e comentário "Ansioso para usar!"
Then a resposta deve ter o status 403
And a resposta deve conter a mensagem "Requisição inválida."

Cenário: Tentar avaliar uma reserva que já foi avaliada
Given uma reserva APROVADA para o equipamento "Projetor da Sala 1" feita pelo "aluno.experiente@email.com" que TERMINOU ONTEM existe
And estou autenticado como o usuário "aluno.experiente@email.com"
When eu envio uma requisição POST para avaliar a reserva novamente
Then a resposta deve ter o status 400

Cenário: Tentar avaliar uma reserva com ID inexistente
Given estou autenticado como o usuário "aluno.experiente@email.com"
When eu envio uma requisição POST para o ID de reserva "9999"
Then a resposta deve ter o status 404
And recebo a mensagem "Recurso não encontrado."
