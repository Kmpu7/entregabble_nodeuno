-- Users--
create table users (
id serial primary key,
	first_name varchar(50),
    last_name varchar(50),
    email varchar(50)
);

INSERT INTO users (first_name, last_name, email) VALUES
('Francisco', 'Campuzano', 'francisco@gmail.com'),
('Alejandro', 'Campuzano', 'ale@gmail.com'),
('Virginia', 'Guerrero', 'virginia@gmail.com');

select * from users
 ---Posts-----
 
 create table posts (
    id SERIAL primary key,
    creator_id integer references users(id),
    title varchar(100),
    text text
);

insert into posts (creator_id, title, text) values
(1, 'Academlo', 'Debo practicar y estudiar'),
(2, 'bajar de peso', 'debo comer mas sano y hacer ejercicios'),
(1, 'Smite', 'hay que mejor la comuncacion del team'),
(3, 'sedentarismo', 'trote deportivo 15 min todos los dias'),
(2, 'IFAB', 'hay que leer los nuevos cambios');

select * from posts

-----LIKES------

create table likes (
    id serial primary key,
    user_id integer references users(id),
    post_id integer references posts(id)
);

insert into likes (user_id, post_id) values
(2, 5),
(1, 1),
(1, 3),
(2, 1),
(3, 2);

select * from likes

-- trae todos los posts e info del usario creator_id---
select posts.*, users.first_name, users.last_name, users.email
from posts
join users on posts.creator_id = users.id;

---trae todos los posts e info de los usuarios que le dieron like---
select posts.*, users.first_name, users.last_name, users.email
from posts
join likes on posts.id = likes.post_id
join users on likes.user_id = users.id;





