
<div align="center">
    <h1>SQL y MySQL</h1>
    <img src="https://imgur.com/0r5s3Rl.png" width="">
</div>

## Introducción al documento

El contenido de este documento es **teorico - practico** del [Curso de SQL y MySQL](https://platzi.com/cursos/sql-mysql/) y busca ser una guía para futuros trabajos. El mismo está dictado por [Alberto Alcocer](https://twitter.com/beco), Desarrollador Independiente. El curso es de [Platzi](https://platzi.com).

Con el curso de SQL se conocerá el lenguaje de consulta estructurada que te permité consultar de manera estructurada la información insertada en la base de datos. Elabora tablas, cruza, elimina, modifica y consulta información. Se aprenderá las funciones de MySQL como gestor de base de datos con el que podrás crear aplicaciones para ejecutar dichas funciones.

## Objetivos del documento

- Crear bases de datos
- Cruza información para la obtención de resultados
- Consulta información en la bases de datos

## Tabla de contenido
- [Curso de SQL y MySQL](#curso-de-sql-y-mysql)
  - [Introducción al Curso de SQL y MySQL](#introducción-al-curso-de-sql-y-mysql)
    - [Introduccioón al curso](#introduccioón-al-curso)
    - [Instalación local de un RDBMS (Ubuntu)](#instalación-local-de-un-rdbms-ubuntu)
    - [La consola de MySQL](#la-consola-de-mysql)
    - [¿Qué es una base de datos?](#qué-es-una-base-de-datos)
  - [CREATE](#create)
    - [Motores de bases de datos](#motores-de-bases-de-datos)
    - [Comando CREATE](#comando-create)
    - [Tipos de columnas / Creación de la tabla books](#tipos-de-columnas--creación-de-la-tabla-books)
      - [Tipos de datos para columnas mas comunes](#tipos-de-datos-para-columnas-mas-comunes)
      - [Creación de la tabla books](#creación-de-la-tabla-books)
    - [Tipos de columnas / Creación de la tabla authors](#tipos-de-columnas--creación-de-la-tabla-authors)
      - [Tips/Recomendaciones](#tipsrecomendaciones)
      - [Comandos sql](#comandos-sql)
      - [Creación de la tabla authors](#creación-de-la-tabla-authors)
    - [Tipos de columnas usados | Creación de la tabla clientes](#tipos-de-columnas-usados--creación-de-la-tabla-clientes)
      - [Tipos de datos usados | columnas de buena práctica](#tipos-de-datos-usados--columnas-de-buena-práctica)
      - [Creación de la tabla clientes](#creación-de-la-tabla-clientes)
    - [DESAFIO | Creación de tabla operations](#desafio--creación-de-tabla-operations)
  - [INSERT](#insert)
    - [Comando INSERT](#comando-insert)
    - [Comando on duplicate key](#comando-on-duplicate-key)
  - [Bash y archivos SQL](#bash-y-archivos-sql)
  - [SELECT](#select)
  - [Consultas en MySQL](#consultas-en-mysql)

# Curso de SQL y MySQL

## Introducción al Curso de SQL y MySQL

### Introduccioón al curso

La diferencia entre SQL y MySQL:

- [SQL](https://es.wikipedia.org/wiki/SQL) (Structured Query Language; lenguaje de consulta estructurada) es un lenguaje de dominio específico utilizado en programación, diseñado para administrar, y recuperar información de sistemas de gestión de bases de datos relacionales. Una de sus principales características es el manejo del álgebra y el cálculo relacional para efectuar consultas con el fin de recuperar, de forma sencilla, información de bases de datos, así como realizar cambios en ellas.

- [MySQL](https://www.mysql.com/) es un sistema de administración de bases de datos (Database Management System, DBMS) o también llamado motor de bases de datos.

Existen muchos tipos de bases de datos, desde un simple archivo hasta sistemas relacionales orientados a objetos. MySQL, como base de datos relacional, utiliza múltiples tablas para almacenar y organizar la información.

Fue escrito en C y C++ y se integra perfectamente con los lenguajes de programación más usados en todo el mundo.

![que_es_mysql](https://imgur.com/JgDLdW2.png)

> NOTA: En el curso sólo se utilizará la consola para hacer consultas.

### Instalación local de un RDBMS (Ubuntu)

[Instalacción de MySQL 5.7 en Ubuntu 20.04](https://computingforgeeks.com/how-to-install-mysql-on-ubuntu-focal/)

### La consola de MySQL

La forma de conectarnos a nuestro servidor MySQL a través de nuestra terminal es:

```shell
$ mysql -h <dirección_de_nuestro_servidor> -u <usuario> -p -P <puerto>
Enter password: <aquí introducirías tu password>?
```

Comandos usados en esta sección:

- `show databases;` -> lista las bases de datos que tiene el servidor

- `use name_database;`-> selecciona o se conecta a la base de datos a trabajar

- `show tables;` -> muestra las tablas que contiene la base de datos

- `select database();` -> muestra cual es la base de datos que tenemos seleccionada o en la que se esta trabajando.

> Todos los comandos deben de terminar con “;”

### ¿Qué es una base de datos?

Se llama **base de datos**, o también banco de datos, a un conjunto de información perteneciente a un mismo contexto, ordenada de modo sistemático para su posterior recuperación, análisis y/o transmisión.

Es un lugar donde podemos ir almacenando datos puntuales de cualquier cantidad de cosas para después operar sobre esos datos y convertirlos en información. Esa información convertirla en operaciones de negocio y las operaciones de negocio convertirlas en dinero, crecimiento sabiduría lo que sea. **TODO RESIDE EN LOS DATOS Y CÓMO OPERAMOS SOBRE LOS DATOS**.

> “Una base de datos es una conglomeración genérica de datos”.

## CREATE

### Motores de bases de datos

> Los **Motores de Bases de Datos**, son programas específicos, dedicados a servir de intermediarios entre las **bases de datos** y las **aplicaciones** que las utilizan como función principal, cada uno de estos cumple una tarea especifica, que van desde **crear** la Base de Datos hasta administrar el **uso y acceso** a esta.

> Un **motor SQL** es un tipo de software que recopila e interpreta comandos SQL para que se puedan realizar las operaciones apropiadas en la base de datos relacional.

Dos tipos de tablas por defecto en MySQL:

- **MyISAM**: directa, sencilla, más rápida y las transacciones son completamente uno a uno. Sus caracteristicas son:

  - Bloqueo de tabla
  - Aumento del rendimiento si nuestra aplicación realiza un elevado número de consultas “Select”.
  - Las tablas pueden llegar a dar problemas en la recuperación de datos.
  - Permite hacer búsquedas full-text
  - Menor consumo memoria RAM
  - Mayor velocidad en general a la hora de recuperar datos.
  - Ausencia de características de atomicidad ya que no tiene que hacer comprobaciones de la integridad referencial, ni bloquear las tablas para realizar las operaciones, esto nos lleva como los anteriores puntos a una mayor velocidad.

- **InnoDB**: nueva, recuperable en caso de falla de disco duro pero es un poco más lenta.

  - Bloqueo de registros
  - Soporte de transacciones
  - Rendimiento
  - Concurrencia
  - Confiabilidad
  - Permite hacer búsquedas full-text (mysql >= 5.6)

> En la vida real usamos las tablas con dos propósitos:
>
> - **Catalogo**: crecerá en un orden lento, según las necesidades de la propia BD. (Listado de Usuarios, InnoDB)
> - **Operación**: se enfocan a lectura, mayor acceso a disco duro. (Prestamos de libros, MyISAM).

### Comando CREATE

```sql
CREATE TABLE IF NOT EXISTS nombre_tabla_en_plural (
    ...nombre_de_columnas...
);
```

### Tipos de columnas / Creación de la tabla books

#### Tipos de datos para columnas mas comunes

- `NOT NULL` permite que un campo no pueda estar sin completar, es distinto `NULO` a `EMPTY`.
- `INTEGER UNSIGNED` permite que no existan signos, de forma que los numeros siempre seran positivos.

>DATO IMPORTANTE: mysql no detecta cuando los datos de `AUTO_INCREMENT` han sido borrados, por tanto seguira con el ultimo dato que guardo.

- `DEFAULT [valor por defecto]`: Si no introducimos ningun dato, mySQl automaticamente le dara al campo el valor de `DEFAULT`.
- La diferencia entre `CHAR` y `VARCHAR` es que en el primer tipo de dato se asigna un valor en memoria por defecto dependiendo el tamaño de espacios que sean asignados, en cambio, `VARCHAR` va llenando esos campos en memoria conforme se tengan los datos en el campo.
- `COMMENT`: Comentario a la columna que solo es visible para quien este manejando la base de datos
- Para imagenes asignamos `VARCHAR`.

> NOTA: no se guarda la imagen como tal, guardamos el url del origen de la imagen.

- `FLOAT` es utilizado para calculos precisos, `DOUBLE` puede ser aplicado de forma simple a los precios de una libreria (en este caso).
- `DOUBLE` (espacios que podremos llenar, espacios asignados para numeros decimales)
- `TEXT` permite agregar texto, grandes cantidades de caracteres.
- `TINYINT` Es un número entero con o sin signo. Con signo el rango de valores válidos va desde -128 a 127. Sin signo, el rango de valores es de 0 a 255. `TINYINT(1)` = BOOL (0 o 1), también llamado bandera.
- `TINYTEXT`, `TEXT`, `BIGTEXT`: Textos de diferente cantidad de espacios soportados, de menor a mayor respectivamente.

#### Creación de la tabla books

```sql
CREATE TABLE IF NOT EXISTS books (
    `book_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `author_id` INTEGER UNSIGNED,
    `title` VARCHAR(100) NOT NULL,
    `year` INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
    `cover_url` VARCHAR(500),
    `price` DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    `sellable` TINYINT(1) DEFAULT 1,
    `copies` INTEGER NOT NULL DEFAULT 1,
    `description` TEXT
);
```

### Tipos de columnas / Creación de la tabla authors

#### Tips/Recomendaciones

- La tablas de bases datos necesitan una `PRIMARY KEY` osea un “id” para **identificar los registros**.

> **Es buena práctica**: MySQL permite minúsculas y mayúsculas en el nombre de tablas y sentencias sql, pero es recomendable colocar en mayúsculas las sentencias(palabras reservadas) sql y todo lo relaciona con lo propio de MySQL y en minúscula el nombre de tablas y columnas.

- Como la relación entre tablas es lógica y se realiza mediante los id, en la tabla en donde se referencia la columna debe ser del mismo tipo de datos.

- **El error vs Warnings**: la diferencia entre estos dos es que el error rompe cualquier flujo de trabajo que tengamos en nuestra aplicación mientras que el warnnigs nos muestra una advertencia que no rompe el flujo de trabajo workflow.

- Cuando queremos usar una palabra reservada del lenguaje como nombre de alguna columna lo colocamos encerrado entre comillas de acento ejemplo: year.

#### Comandos sql

> TENER **MUCHO CUIDADO** CON EL SIGUIENTE COMANDO **`DROP`**, **PODEMOS PERDER MUCHO TIEMPO/DINERO** SI LO HACEMOS POR ERROR. **VERIFICAR SIEMPRE**.

- `DROP TABLE name_table;` borra la estructura de la tabla de bases de datos y su contenido.

```sql
/*Eliminar una tabla*/
DROP TABLE `authors`;
```

- `DESCRIBE name_table;` muestra la estructura de nuestra tabla. Nos muestra las columnas: field, type, Null, Key, Default, Extra.

```sql
/*describe el contenido (columnas) de la tabla books*/
DESCRIBE `books`;
```

- `DESC name_table;` es un acrónimo de `DESCRIBE` que realiza la misma función de describir la estructura de la tabla.

- `SHOW FULL COLUMNS FROM name_table;` Esta función describe la estructura de la bases de datos incluyendo más información cómo: field, Type, Collation, Null, Key, Default, Extra, Privileges, comment.

```sql
SHOW FULL COLUMNS FROM `books`;
```

#### Creación de la tabla authors

```sql
CREATE TABLE IF NOT EXISTS authors(
    `author_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL, 
    `nationality` VARCHAR(3)
);
```

### Tipos de columnas usados | Creación de la tabla clientes

#### Tipos de datos usados | columnas de buena práctica

- El no colocar `AUTO_INCREMENT` a la columna que es PRIMARY KEY simplemente vuelve el proceso de asignar id a una forma manual o se puede asignar desde otra capa de negocios.

- `UNIQUE`, la columna que tenga el constraint **unique** garantiza que el valor que se guarda en esa columna sea único

- `TIMESTAMP` Está basado en el número **epoch** que es el **1 enero de 1970** hasta la fecha y es donde se determina el inicio de las computadoras. Es un número entero que se guarda en segundos y permite hacer operaciones sobre él.

- `DATETIME` Este tipo de dato puede guardar cualquier valor de tipo fecha sin restricción. Incluso anterior a nuestra era. Por eso las fechas de nacimiento de usuarios debe utilizar este valor para garantizar que podemos registrarlos con la fecha adecuada.

> TIMESTAMP vs DATETIME: hay que resaltar que:
> 1. `TIMESTAMP` “NO PUEDE HACER TODO LO DE `DATETIME` pero `DATETIME` SÍ PUEDE HACERLO DE UN `TIMESTAMP`”.
> 2. `DATETIME` no está guardado en segundos y no es tan eficiente para hacer cálculos.

- `active`

Es buena práctica no eliminar registros de una bases de datos es por ello que se crea una columna como active que es un valor booleano. Dicho valor sirve para para decir si el registro está activo o no.

- `created_ad` y `updated_ad`

Es buena práctica tener una columna que permite saber el momento exacto en el que se crea un registro o se actualiza. Este tipo de dato se comporta más como una meta-información y nos puede ayudar, por ejemplo, a cuántos usuarios fueron creados en una fecha en específico, saber cuando una tupla se actualizó, etc.

- `created_ad`

Es una columna de buena práctica que permite saber cuando se creó un registro. Está utilizará un conjunto de propiedades llamada entre ella se colocará `DEFAULT CURRENT_TIMESTAMP` . Cuando se realiza un insert sí el valor de esta columna viene vacío colocará en la tupla el valor de la fecha en que se creó de manera automática .

#### Creación de la tabla clientes

```sql
CREATE TABLE clients(
    `client_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `birthdate` DATETIME,
    `gender` ENUM('M', 'F', 'ND') NOT NULL,
    `active` TINYINT(1) NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
```

### DESAFIO | Creación de tabla operations

```sql
CREATE TABLE IF NOT EXISTS operations(
    `operation_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `book_id` INTEGER UNSIGNED NOT NULL,
    `client_id` INTEGER UNSIGNED NOT NULL,
    `operation_type` ENUM('B', 'R', 'S') NOT NULL COMMENT 'B=BORROWED, R=RETURNED, S=SOLD',
    /*[prestado(operacion no finializada), devuelto(oper finalizada) o vendido(oper finalizada)],*/
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP,
    `finished` TINYINT(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

## INSERT

### Comando INSERT

> Buenas prácticas:
> 1. Tener una buen modelo de bases de datos y un buen modelo de negocio que evite la duplicidad de información ya que esto nos ahorra el tiempo de procesamiento, ahorra en espacio.
> 2. Realizar inserciones de 50 registros máximo. Esto no es necesariamente obligatorio pero funciona muy bien y esto se hace porque sí hay algún problema en la inserción sólo se pierde datos de 50 a 50.

Formas de insertar:

1. 
```sql
/*Existe varias formas de hacer insert, según las
versiones de mysql que tengamos instalados estas son
algunas de ellas*/
INSERT INTO  authors (author_id,name,nationality) VALUES (NULL,'Juan Rulfo','MEX');
INSERT INTO  authors (author_id,name,nationality) VALUES (NULL,'Gabriel García Máquez','COL');
INSERT INTO  authors VALUES ('Juan Gabriel Vasquez','COL');
```
2. 
```sql
/*otra forma, que sí funciona*/
INSERT INTO  `authors` (name,nationality)
    VALUES  ('Juan Rulfo','MEX'),
            ('Gabriel García Máquez','COL'),
            ('Juan Gabriel Vasquez','COL'),
            ('Julio Cortázar','COL'),
            ('Isabelle Allende','CHI'),
            ('Octavio Paz','MEX'),
            ('Juan Carlos Onetti','URU');
```
3.
```sql
/*o si sabemos que hay un id que no existe podemos insertarlos juntos con su  id*/
INSERT INTO  `authors` (author_id,name,nationality)
    VALUES ('16','Pablo Neruda','MEX');
```

### Comando on duplicate key

`ON DUPLICATE KEY` sirve para insertar un dato que ya esta creado pero queremos actualizar un atributo de ese dato por uno nuevo.

```sql
INSERT INTO `clients`(name, email, birthdate, gender, active)
VALUES ('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M', 0)
ON DUPLICATE KEY UPDATE active = VALUES(active)
```

Opciones:

1. `ON DUPLICATE KEY IGNORE ALL` esto indica que si hay algun error, lo va a ignorar y va a correr la sentencia.

> **NUNCA UTILIZAR, EVITAR A TODA COSTA.**
> Los errores están ahi para algo, sin embargo la recomendación es NUNCA usar IGNORE ALL en una sentencia SQL de MYSQL.

2. `ON DUPLICATE KEY UPDATE active = VALUES(active)` para cambiarle el valor de activo, de 1 a 0. Esta sentencia con la palabra UPDATE nos permite actualizar la información por alguna otra. Hay hos formas de hacer esto:

  - `ON DUPLICATE KEY UPDATE active = 0;`
  - `ON DUPLICATE KEY UPDATE active = VALUES(active);`

## Bash y archivos SQL

## SELECT

## Consultas en MySQL
