
CREATE TABLE actor (
    act_id INT PRIMARY KEY,
    act_fname VARCHAR(20),
    act_lname VARCHAR(20),
    act_gender CHAR(1)
);

CREATE TABLE director (
    dir_id INT PRIMARY KEY,
    dir_fname VARCHAR(20),
    dir_lname VARCHAR(20)
);

CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name VARCHAR(30)
);

CREATE TABLE genres (
    gen_id INT PRIMARY KEY,
    gen_title VARCHAR(20)
);

CREATE TABLE movie (
    mov_id INT PRIMARY KEY,
    mov_title VARCHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang VARCHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);

CREATE TABLE movie_cast (
    act_id INT,
    mov_id INT,
    role VARCHAR(30),
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_direction (
    dir_id INT,
    mov_id INT,
    PRIMARY KEY (dir_id, mov_id),
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_genres (
    mov_id INT,
    gen_id INT,
    PRIMARY KEY (mov_id, gen_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

CREATE TABLE rating (
    mov_id INT,
    rev_id INT,
    rev_stars INT,
    num_o_ratings INT,
    PRIMARY KEY (mov_id, rev_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);

INSERT INTO actor VALUES (1, 'Tom', 'Hanks', 'M');
INSERT INTO actor VALUES (2, 'Emma', 'Watson', 'F');

INSERT INTO director VALUES (1, 'Steven', 'Spielberg');

INSERT INTO reviewer VALUES (1, 'John Doe');

INSERT INTO genres VALUES (1, 'Action');
INSERT INTO genres VALUES (2, 'Drama');

INSERT INTO movie VALUES 
(1, 'The Terminal', 2004, 128, 'English', '2004-06-18', 'USA');

INSERT INTO movie_cast VALUES 
(1, 1, 'Viktor Navorski'),
(2, 1, 'Amelia Warren');

INSERT INTO movie_direction VALUES 
(1, 1);

INSERT INTO movie_genres VALUES 
(1, 1),
(1, 2);

INSERT INTO rating VALUES 
(1, 1, 4, 100);


SELECT * FROM movie
WHERE mov_year = 2004;


SELECT mov_title FROM movie
WHERE mov_title LIKE '%Term%';

SELECT act_fname, act_lname FROM actor
ORDER BY act_lname ASC;

SELECT m.mov_title, r.rev_stars
FROM movie m
JOIN rating r ON m.mov_id = r.mov_id
WHERE r.rev_stars > 3
ORDER BY r.rev_stars DESC;
