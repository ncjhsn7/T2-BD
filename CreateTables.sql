CREATE TABLE Albuns (
    Id_Album VARCHAR2(18) PRIMARY KEY NOT NULL,
    Nome VARCHAR2(50) NOT NULL,
    DataLancamento DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE Usuarios (
    Id_Usuario VARCHAR2(18) PRIMARY KEY NOT NULL,
    Nome VARCHAR2(50) NOT NULL
);

CREATE TABLE Seguindo_Seguidores (
    Id_Seguidor VARCHAR2(18) NOT NULL,
    Id_Seguindo VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Seguidores PRIMARY KEY (Id_Seguidor, Id_Seguindo),
    CONSTRAINT FK_Seguindo FOREIGN KEY (Id_Seguidor) REFERENCES Usuarios(Id_Usuario),
    CONSTRAINT FK_Seguidor FOREIGN KEY (Id_Seguindo) REFERENCES Usuarios(Id_Usuario)
);


CREATE TABLE Artistas (
    Id_Artista VARCHAR2(18) PRIMARY KEY NOT NULL,
    Nome VARCHAR2(50) NOT NULL
);

CREATE TABLE Musicas (
    Id_Musica VARCHAR2(18) PRIMARY KEY NOT NULL,
    Nome VARCHAR2(18) NOT NULL,
    Genero VARCHAR2(50) NOT NULL,
    Duracao INT NOT NULL,
    VezesReproduzida INT,
    Id_Album VARCHAR2(18),
    DataLancamento DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT FK_Album_Musica FOREIGN KEY (Id_Album) REFERENCES Albuns(Id_Album)
);

CREATE TABLE Musicas_Artistas (
    Id_Musica VARCHAR2(18) NOT NULL,
    Id_Artista VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Musicas_Artistas PRIMARY KEY (Id_Musica, Id_Artista),
    CONSTRAINT FK_Musica_Artista FOREIGN KEY (Id_Musica) REFERENCES Musicas(Id_Musica),
    CONSTRAINT FK_Artista_Musica FOREIGN KEY (Id_Artista) REFERENCES Artistas(Id_Artista)
);

CREATE TABLE Playlists (
    Id_Playlist VARCHAR2(18) PRIMARY KEY NOT NULL,
    Id_Usuario VARCHAR2(18) NOT NULL,
    Publica VARCHAR2(1),
    CONSTRAINT FK_Usuario_Playlist FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario)
);

CREATE TABLE Playlists_Seguidores (
    Id_Playlist VARCHAR2(18) NOT NULL,
    Id_Usuario VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Playlists_Seguidores PRIMARY KEY (Id_Playlist, Id_Usuario),
    CONSTRAINT FK_Id_Playlist FOREIGN KEY (Id_Playlist) REFERENCES Playlists(Id_Playlist),
    CONSTRAINT FK_Autor_Playlist FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario)
);

CREATE TABLE Playlists_Musicas (
    Id_Playlist VARCHAR2(18) NOT NULL,
    Id_Musica VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Playlists_Musicas PRIMARY KEY (Id_Playlist, Id_Musica),
    CONSTRAINT FK_Musica_Playlist FOREIGN KEY (Id_Musica) REFERENCES Musicas(Id_Musica),
    CONSTRAINT FK_Playlist_Musica FOREIGN KEY (Id_Playlist) REFERENCES Playlists(Id_Playlist)
);

CREATE TABLE Usuarios_Playlists (
    Id_Usuario VARCHAR2(18) NOT NULL,
    Id_Playlist VARCHAR2(18) NOT NULL,
    Colaborador VARCHAR2(1),
    CONSTRAINT PK_Usuario_Playlist PRIMARY KEY (Id_Usuario, Id_Playlist),
    CONSTRAINT FK_Usuario_Playlist_Vinculo FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario),
    CONSTRAINT FK_Playlist_Usuario_Vinculo FOREIGN KEY (Id_Playlist) REFERENCES Playlists(Id_Playlist)
);

CREATE TABLE Artistas_Seguidores (
    Id_Usuario VARCHAR2(18) NOT NULL,
    Id_Artista VARCHAR2(18) NOT NULL,
    CONSTRAINT PK_Artistas_Seguidores PRIMARY KEY (Id_Usuario, Id_Artista),
    CONSTRAINT FK_Seguindo_Artista FOREIGN KEY (Id_Artista) REFERENCES Artistas(Id_Artista),
    CONSTRAINT FK_Usuario_Seguindo_Artista FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario)
);

