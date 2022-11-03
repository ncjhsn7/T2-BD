# T2-BD

## Pré configuração do BD
primeiro executar os comandos que estão no arquivo `CreateTables.sql` e depois preencher os dados das tabelas com o arquivo `LoadData.sql`.

##Consultas
Obter músicas por `Album`:
```
SELECT Id_Musica, Nome, Id_Album FROM Musicas WHERE Id_Album = 'ID DO ALBUM'
```

##Músicas de uma `Playlist`:
```
SELECT Nome FROM Musicas WHERE Id_Musica IN (SELECT Id_Musica FROM Playlists_Musicas WHERE id_playlist = 'ID DA PLAYLIST');
```

##Total de reproduções de músicas de um `Artista`:
```
SELECT Nome FROM Musicas WHERE Id_Musica IN (SELECT Id_Musica FROM Musicas_Artistas WHERE Id_Artista = 'ID DO ARTISTA')
```

##