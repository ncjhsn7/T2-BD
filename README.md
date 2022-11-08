# T2-BD

##
O intuito do trabalho é construir um banco de dados simulando uma versão mais geral do `Spotify` contendo tabelas em que constam as informações de Artistas, Usuários, Seguidores, Playlists, Músicas, Álbuns.

# Tabelas primárias
## Artistas
Utilizada para salvar os produtores de músicas. Contém as colunas `Id_Artistas` (PK) e `Nome`. Sem nenhuma chave estrangeira.

## Usuarios
São as pessoas que utilizam a plataforma. Contém as colunas `Id_Usuario` (PK) e `Nome`. Sem nenhuma chave estrangeira.

## Albuns
Servem para fazer uma coletânea de músicas de um artista. Contém as colunas `Id_Album` (PK), `Nome` e `Data_Lancamento`.

## Musicas
Praticamente a tabela principal do trabalho. Nesta tabela está contida as informações de `Id_Musica` (PK), `Nome`, `Genero`, `Duracao`,
`Vezes_Reproduzida`, `Id_Album` (FK) para a tabela `Albuns`, `Data_Lancamento`.

## Playlists
Tabela para identificar um conjunto de músicas de um usuário. Contém as informações `Id_Playlist` (PK), `Id_Usuario` (FK) para a tabela `Usuarios` e uma coluna `Publica` para identificar se essa tabela é visivel para outros usuários. Na coluna `Publica` não foi feito nenhuma validação para saber se ela é publica ou privada na hora de definir os seguidores dessa playlist.

# Tabelas de Relacionamento
## Musicas_Artistas
Utilizada para definir de quem é uma determinada música, 


## Pré configuração do BD
primeiro executar os comandos que estão no arquivo `CreateTables.sql` e depois preencher os dados das tabelas com o arquivo `LoadData.sql`.

## Consultas
Obter `Musicas` por `Albuns`:
```
SELECT Id_Musica, Nome, Id_Album FROM Musicas WHERE Id_Album = 'BE'
```

`Musicas` de uma `Playlist`:
```
SELECT Nome FROM Musicas WHERE Id_Musica IN (SELECT Id_Musica FROM Playlists_Musicas WHERE id_playlist = 'my_playlist#1');
```

`Musicas` com seus respectivos `Albuns`:
```
SELECT m.Nome, a.nome FROM Musicas m JOIN Albuns a ON a.Id_Album = m.Id_Album
```

Obter somatório de reprodução de um `Album`:
```
SELECT SUM(vezes_reproduzida) FROM Musicas WHERE Id_Album = 'FUTURENOSTALGIA'
```

## Nicolas Pietro, Ariel Menezes, Larissa Esteves, Nathalie de Avila
