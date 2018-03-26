/*drop database if exists MapaEcologico;*/
create database MapaEcologico;
use MapaEcologico;

create table Area(
	IdArea smallint not null auto_increment,
    NombreArea varchar(20),
    Latitud float not null,
    Longitud float not null,
    primary key(IdArea) 
);

create table Riego(
	IdRiego smallint not null auto_increment,
    IdArea smallint not null,
    TipoRiego varchar(20),
	primary key(IdRiego),
	foreign key(IdArea) references Area (IdArea)
);

create table Maceta(
	IdMaceta smallint not null auto_increment,
    IdArea smallint not null,
	Planta char(2),
    Latitud float,
    Longitud float,
	primary key(IdMaceta),
	foreign key(IdArea) references Area (IdArea)
);

create table LlaveAgua(
	IdLlave smallint not null auto_increment,
    IdArea smallint not null,
	Descripcion varchar(20),
    Latitud float not null,
    Longitud float not null,
	primary key(IdLlave),
	foreign key(IdArea) references Area (IdArea)
);

create table Clasificacion(
	IdClasificacion smallint not null auto_increment,
    TipoArbol varchar(20),
    Descripcion varchar(50),
    NCientifico varchar(20),
    Protegido char(2),
    ImpactoEco varchar(20),
    PeligroExtincion char(2),
	primary key(IdClasificacion)
);

create table Arbol(
	IdArbol smallint not null auto_increment,
    IdArea smallint not null,
    IdClasificacion smallint not null,
    Latitud float not null,
    Longitud float not null,
    primary key(IdArbol),
    foreign key(IdArea) references Area (IdArea),
	foreign key(IdClasificacion) references Clasificacion (IdClasificacion)
);

create table Usuario(
	NombreUsuario char(30) not null,
    Correo char(30) not null,
    Contraseña char(30) not null,
    Latitud float,
    Longitud float,
    primary key(NombreUsuario)
);

create table Fotografia(
	IdFoto smallint not null auto_increment,
    NombreUsuario char(30) not null,
    FechaFoto date not null,
    Latitud float,
    Longitud float,
    primary key(IdFoto),
    foreign key(NombreUsuario) references Usuario (NombreUsuario)
);

create table AreaFoto(
	IdAreaFoto smallint not null auto_increment,
    IdArea smallint not null,
    IdFoto smallint not null,
    primary key(IdAreaFoto),
	foreign key(IdArea) references Area (IdArea),
    foreign key(IdFoto) references Fotografia (IdFoto)
);

create table TipoObjeto(
	IdTipoObjeto smallint not null auto_increment,
    Descripcion varchar(30),
    primary key(IdTipoObjeto)
);

create table DescripcionFoto(
	IdDescripcion smallint not null auto_increment,
    IdFoto smallint not null,
    IdTipoObjeto smallint not null,
    primary key(IdDescripcion),
	foreign key(IdFoto) references Fotografia (IdFoto),
    foreign key(IdTipoObjeto) references TipoObjeto (IdTipoObjeto )
);

create table Historico(
	IdHistorico smallint not null auto_increment,
    IdTipoObjeto smallint not null,
    Fecha date not null,
     Descripcion varchar(50),
    primary key(IdHistorico),
	foreign key(IdTipoObjeto) references TipoObjeto (IdTipoObjeto)
);
