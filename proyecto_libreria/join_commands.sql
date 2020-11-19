
-- Listar todos los autores con ID entre 1 y 5 con los filtro mayor y menor igual
SELECT * FROM authors WHERE author_id > 0 AND author_id <= 5;

-- Listar todos los autores con ID entre 1 y 5 con el filtro BETWEEN
SELECT * FROM authors WHERE author_id BETWEEN 1 AND 5;

-- Listar los libros con filtro de author_id entre 1 y 5
SELECT book_id, author_id, title FROM books WHERE author_id BETWEEN 1 AND 5;

-- Listar nombre y titulo de libros mediante el JOIN de las tablas books y authors
SELECT b.book_id, a.name, a.author_id, b.title
FROM books AS b
JOIN authors AS a
  ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5;

-- Listar transactions con detalle de nombre, titulo y tipo. Con los filtro genero = F y tipo = Vendido.
-- Haciendo join entre transactions, books y clients.
SELECT c.name, b.title, t.type
FROM transactions AS t
JOIN books AS b
  ON t.book_id = b.book_id
JOIN clients AS c
  ON t.client_id = c.client_id
WHERE c.gender = 'F'
  AND t.type = 'sell';

-- Listar transactions con detalle de nombre, titulo, autoor y tipo. Con los filtro genero = M y de tipo = Vendido y Devuelto.
-- Haciendo join entre transactions, books, clients y authors.
SELECT c.name, b.title, a.name AS 'author of book', t.type
FROM transactions AS t
JOIN books AS b
  ON t.book_id = b.book_id
JOIN clients AS c
  ON t.client_id = c.client_id
JOIN authors AS a
  ON b.author_id = a.author_id
WHERE c.gender = 'M'
  AND t.type IN ('sell', 'lend');

-- --------------- Clase: Left JOIN ---------------
-- CASOS DE EJEMPLO

-- Uso del JOIN implícito
SELECT b.title, a.name
FROM authors AS a, books AS b
WHERE a.author_id = b.author_id
LIMIT 10;

-- Uso del JOIN explícito
SELECT b.title, a.name
FROM books AS b
INNER JOIN authors AS a
  ON a.author_id = b.author_id
LIMIT 10;

-- Ambos casos son iguales, pero el segundo se puede leer claramente 
-- mas rapido


--  JOIN y order by (por defecto es ASC)
SELECT a.author_id, a.name AS 'author name', a.nationality, b.title AS 'title of book'
FROM authors AS a
JOIN books AS b
  ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id DESC;

-- LEFT JOIN para traer datos incluso que no existen, como el caso del author_id = 4 que no tene ningún libro registrado.
SELECT a.author_id, a.name AS 'author name', a.nationality, b.title AS 'title of book'
FROM authors AS a
LEFT JOIN books AS b
  ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id;

-- Contar número de libros tiene un autor.
-- Con COUNT (contar), es necesario tener un GROUP BY (agrupado por un criterio)
SELECT a.author_id, a.name AS 'author name', a.nationality, COUNT(b.book_id)
FROM authors AS a
LEFT JOIN books AS b
  ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY a.author_id
ORDER BY a.author_id;
