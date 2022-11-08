# T2-BD

##
O intuito do trabalho é construir um banco de dados simulando uma versão mais geral do `Spotify` contendo tabelas em que constam as informações de Artistas, Usuários, Seguidores, Playlists, Músicas, Álbuns.

# Tabelas primárias
## Artistas
Utilizada para salvar os produtores de músicas. Contém as colunas `id_artistas` (PK) e `nome`. Sem nenhuma chave estrangeira.

## Usuarios
São as pessoas que utilizam a plataforma. Contém as colunas `id_usuario` (PK) e `nome`. Sem nenhuma chave estrangeira.

## Albuns
Servem para fazer uma coletânea de músicas de um artista. Contém as colunas `id_album` (PK), `nome` e `data_lancamento`.

## Musicas
Praticamente a tabela principal do trabalho. Nesta tabela está contida as informações de `id_musica` (PK), `nome`, `genero`, `duracao`,
`vezes_reproduzida`, `id_album` (FK) para a tabela `albuns`, `data_lancamento`.

## Playlists
Tabela para identificar um conjunto de músicas de um usuário. Contém as informações `id_playlist` (PK), `id_usuario` (FK) para a tabela `Usuarios` e uma coluna `publica` para identificar se essa tabela é visivel para outros usuários. Na coluna `publica` não foi feito nenhuma validação para saber se ela é publica ou privada na hora de definir os seguidores dessa playlist.

# Tabelas de Relacionamento
## Musicas_Artistas
Utilizada para definir de quem é uma determinada música e une as tabelas `Musicas` e `Artistas` com as colunas `id_musica` (FK/PK) e `id_artista` (FK/PK).

## Usuarios_Playlists
Utilizada para vincular uma playlist ao um usuário e verificar se ele é dono, colaborador ou não possui vínculo com ela. Possui duas colunas como chave primária e estrangeira ao mesmo tempo da tabela `id_usuario` e `id_playlist` e uma coluna de colaborador/dono `colaborador`.
Na coluna `colaborador` possui valores definidos como 0 = sem nenhum vinculo, 1 = colaborador, 2 = dono.

## Playlists_Musicas
Utilizada para vincular músicas de uma playlist que une as tabelas `Playlists` e `Musicas` com as colunas `id_playlist` e `id_musica` (FK/PK).

## Playlists_Seguidores
Utilizada para identificar quais usuários seguem uma playlist que une as tabelas `Playlists` e `Usuarios` com as colunas `id_playlist` e `id_usuario` (FK/PK).

## Seguindo_Seguidores
Utilizada para identificar quais usuários seguem uns aos outros que auto vincula a tabela `Usuarios` com as colunas `id_usuario` e `id_usuario` (FK/PK).

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
