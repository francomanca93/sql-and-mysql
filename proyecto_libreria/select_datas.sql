SELECT name, email, YEAR(NOW()) - YEAR(birthdate) AS edad, gender
FROM clients
WHERE gender = 'F'
    AND name LIKE '%Lop%';

/*-------- clase 2 -----------*/
SELECT b.book_id, a.name, a.author_id, b.title
FROM books as b
JOIN authors as a 
    ON a.author_id = b.author_id
WHERE a.author_id between 1 and 5;


SELECT c.name, b.title, t.type
FROM transactions as t
JOIN books as b
    ON t.book_id = b.book_id
JOIN clients as c
    ON t.client_id = c.client_id;


SELECT c.name, b.title, a.name, t.type
FROM transactions as t
JOIN books as b
    ON t.book_id = b.book_id
JOIN clients as c
    ON t.client_id = c.client_id
JOIN authors as a
    ON b.author_id = a.author_id
WHERE c.gender = 'F' 
    AND t.type = 'sell';
