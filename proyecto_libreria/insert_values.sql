/*---------authors table---------*/
INSERT INTO authors(author_id, name, nationality)
VALUE(NULL, 'Juan Rulfo', 'MEX');

INSERT INTO authors(name, nationality)
VALUES('Gabriel García Márquez', 'COL');

INSERT INTO authors
VALUES(NULL, 'Juan Gabriel Vazquez', 'COL');

INSERT INTO authors(name, nationality)
VALUES ('Julio Cortázar', 'ARG'),
       ('Isabel Allende', 'CHI'),
       ('Octavio Paz', 'MAX'),
       ('Juan Carlos Onetti', 'URU');

/*---------clients table---------*/
INSERT INTO `clients`(client_id, name, email, birthdate, gender, active) VALUES
	(1,'Maria Dolores Gomez','Maria Dolores.95983222J@random.names','1971-06-06','F',1),
	(2,'Adrian Fernandez','Adrian.55818851J@random.names','1970-04-09','M',1),
	(3,'Maria Luisa Marin','Maria Luisa.83726282A@random.names','1957-07-30','F',1),
	(4,'Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',1);

/*Error al insertar un valor repetido*/
INSERT INTO `clients`(name, email, birthdate, gender, active) VALUES
	('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',1);
/*ERROR 1062 (23000): Duplicate entry 'Pedro.78522059J@random.names' for key 'email'*/

/* Utilizando comando ON DUPLICATE KEY */
INSERT INTO `clients`(name, email, birthdate, gender, active) 
VALUES ('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M', 0)
ON DUPLICATE KEY UPDATE active = VALUES(active)

/* Inserción de datos usando queries anidados */

El Laberinto de la Soledad, Octavio Paz, 1952
Vuelta al Laberinto de la Soledad, Octavio Paz, 1960

INSERT INTO books(title, author_id) 
VALUE('El Laberinto de la Soledad', 6);

INSERT INTO books(title, author_id, year) 
VALUE('Vuelta al Laberinto de la Soledad', 
    (SELECT author_id FROM authors
    WHERE name = 'Octavio Paz'
    LIMIT 1
    ), 1960
);
