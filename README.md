
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
  - [INSERT](#insert)
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

## INSERT

## Bash y archivos SQL

## SELECT

## Consultas en MySQL
