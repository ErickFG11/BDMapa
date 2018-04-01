use MapaEcologico;

INSERT INTO area (NombreArea,Latitud,Longitud) VALUES
("Frente","20.218154035770773","-101.10150948429094"),
("Detras","20.21899695011386","-101.10151529665023"),
("DelanteEstac","20.218244543004005","-101.10220878936639"),
("Camino","20.21824932519263","-101.10279418148389");

INSERT INTO usuario (NombreUsuario,Correo,Contraseña,Latitud,Longitud) VALUES
("AdminErick","e.francogaona@ugto.mx","ErickUG2018",NULL,NULL),
("AdminSusana","susana.avila@ugto.mx","SusanaUG2018",NULL,NULL),
("AdminBerna","b.quintinoguzman@ugto.mx","-BernaUG2018",NULL,NULL);

select * from area;