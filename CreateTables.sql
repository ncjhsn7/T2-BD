CREATE TABLE Albuns (
    id_album VARCHAR2(18) PRIMARY KEY NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    data_lancamento DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE Usuarios (
    id_usuario VARCHAR2(18) PRIMARY KEY NOT NULL,
    nome VARCHAR2(50) NOT NULL
);

CREATE TABLE Artistas (
    id_artista VARCHAR2(18) PRIMARY KEY NOT NULL,
    nome VARCHAR2(50) NOT NULL
);

CREATE TABLE Musicas (
    id_musica VARCHAR2(18) PRIMARY KEY NOT NULL,
    nome VARCHAR2(18) NOT NULL,
    genero VARCHAR2(50) NOT NULL,
    duracao INT NOT NULL,
    vezes_reproduzida INT,
    id_album VARCHAR2(18),
    data_lancamento DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT FK_Album_Musica FOREIGN KEY (id_album) REFERENCES Albuns(id_album)
);

CREATE TABLE Playlists (
    id_playlist VARCHAR2(18) PRIMARY KEY NOT NULL,
    id_usuario VARCHAR2(18) NOT NULL,
    publica VARCHAR2(1),
    CONSTRAINT FK_Usuario_Playlist FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Musicas_Artistas (
    id_musica VARCHAR2(18) NOT NULL,
    id_artista VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Musicas_Artistas PRIMARY KEY (id_musica, id_artista),
    CONSTRAINT FK_Musica_Artista FOREIGN KEY (id_musica) REFERENCES Musicas(id_musica),
    CONSTRAINT FK_Artista_Musica FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);

CREATE TABLE Playlists_Seguidores (
    id_playlist VARCHAR2(18) NOT NULL,
    id_usuario VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Playlists_Seguidores PRIMARY KEY (id_playlist, id_usuario),
    CONSTRAINT FK_id_playlist FOREIGN KEY (id_playlist) REFERENCES Playlists(id_playlist),
    CONSTRAINT FK_Autor_Playlist FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Playlists_Musicas (
    id_playlist VARCHAR2(18) NOT NULL,
    id_musica VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Playlists_Musicas PRIMARY KEY (id_playlist, id_musica),
    CONSTRAINT FK_Musica_Playlist FOREIGN KEY (id_musica) REFERENCES Musicas(id_musica),
    CONSTRAINT FK_Playlist_Musica FOREIGN KEY (id_playlist) REFERENCES Playlists(id_playlist)
);

CREATE TABLE Usuarios_Playlists (
    id_usuario VARCHAR2(18) NOT NULL,
    id_playlist VARCHAR2(18) NOT NULL,
    Colaborador VARCHAR2(1),
    CONSTRAINT PK_Usuario_Playlist PRIMARY KEY (id_usuario, id_playlist),
    CONSTRAINT FK_Usuario_Playlist_Vinculo FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    CONSTRAINT FK_Playlist_Usuario_Vinculo FOREIGN KEY (id_playlist) REFERENCES Playlists(id_playlist)
);

CREATE TABLE Artistas_Seguidores (
    id_usuario VARCHAR2(18) NOT NULL,
    id_artista VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Artistas_Seguidores PRIMARY KEY (id_usuario, id_artista),
    CONSTRAINT FK_Seguindo_Artista FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista),
    CONSTRAINT FK_Usuario_Seguindo_Artista FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Seguindo_Seguidores (
    id_seguidor VARCHAR2(18) NOT NULL,
    id_seguindo VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Seguidores PRIMARY KEY (id_seguidor, id_seguindo),
    CONSTRAINT FK_Seguindo FOREIGN KEY (id_seguidor) REFERENCES Usuarios(id_usuario),
    CONSTRAINT FK_Seguidor FOREIGN KEY (id_seguindo) REFERENCES Usuarios(id_usuario)
);
