# T2-BD

## Pré configuração do BD
primeiro executar os comandos que estão no arquivo `CreateTables.sql` e depois preencher os dados das tabelas com o arquivo `LoadData.sql`.

## Consultas
Obter `Musicas` por `Albuns`:
```
SELECT Id_Musica, Nome, Id_Album FROM Musicas WHERE Id_Album = 'ID DO ALBUM'
```

`Musicas` de uma `Playlist`:
```
SELECT Nome FROM Musicas WHERE Id_Musica IN (SELECT Id_Musica FROM Playlists_Musicas WHERE id_playlist = 'ID DA PLAYLIST');
```

`Musicas` com seus respectivos `Albuns`:
```
SELECT m.Nome, a.nome FROM Musicas m JOIN Albuns a ON a.Id_Album = m.Id_Album
```

## Nicolas Pietro, Ariel Menezes, Larissa Esteves, Nathalie de Avila