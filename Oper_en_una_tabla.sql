-- PARTE 1
-- 1.- Creacion de Base de datos "posts"
CREATE DATABASE posts;

-- 2.- Creacion de tabla "post" : 
-- * |"id" | "nombre_de_usuario" | "fecha_de_creacion" | "contenido" | "descripcion" |
CREATE TABLE post(
    id INT UNIQUE,
    nombre_de_usuario VARCHAR(25) NOT NULL,
    fecha_de_creacion DATE,
    contenido VARCHAR(1000),
    descripcion VARCHAR(500),
    -- Para el punto 9
    PRIMARY KEY(id)
);

-- 3.- Insertar 3 post: 
-- * 2 post para "Pamela"
-- * 1 post para "Carlos"
INSERT INTO post (id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
VALUES (1, 'Pamela', '2020-10-10', 'Hola Mundo', 'Primer post de Pamela');

INSERT INTO post (id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
VALUES (2, 'Pamela', '2020-10-20', 'Creando tablas en SQL', 'Segundo post de Pamela');

INSERT INTO post (id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
VALUES (3, 'Carlos', '2020-10-25', 'Creacion de Paginas Web', 'Primer post de Carlos');

-- 4.- Modificar la tabla post:
-- * Agregando la columna titulo
ALTER TABLE post
ADD titulo VARCHAR(25);

-- 5.- Agregar titulo a las publicaciones ya ingresadas
UPDATE post
SET titulo='Titulo Pamela 1'
WHERE id=1;

UPDATE post
SET titulo='Titulo Pamela 2'
WHERE id=2;

UPDATE post
SET titulo='Titulo Carlos'
WHERE nombre_de_usuario='Carlos';

-- 6.- Insertar 2 post para el usuario "Pedro"
INSERT INTO post (id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES (4, 'Pedro', '2020-11-01', 'Programacion en Ruby', 'Primer post de Pedro', 'Titulo Pedro 1');

INSERT INTO post (id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES (5, 'Pedro', '2020-11-02', 'Piedra Papel o Tijeras', 'Segundo post de Pedro', 'Titulo Pedro 2');

-- 7.- Eliminar el post de Carlos
DELETE FROM post WHERE nombre_de_usuario='Carlos';

-- 8.- Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO post (id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES (6, 'Carlos', '2020-11-15', 'Las Bondades de Bootstrap', 'Segundo post de Carlos', 'Titulo Carlos 2');


-- PARTE 2
-- 9.- Crear nueva tabla "comentarios":
-- * |"id" | "fecha_y_hora_de_creacion" | "contenido" |
-- * que se relacione con la tabla posts
CREATE TABLE comentarios(
    id INT,
    fecha_y_hora_de_creacion TIMESTAMP,
    contenido VARCHAR(1000),
    -- La relacion entre las tablas la estoy haciendo con los "id" de los posts,
    -- imagino que es un foro y alguien publico un post y a ese respectivo post
    -- la gente le hace comentarios, así me lo imagino
    FOREIGN KEY (id) REFERENCES post(id)
);

-- 10.- Crear comentarios:
-- * 2 para el post de "Pamela"
-- * 4 para "Carlos"

-- Comentarios para post de Pamela
INSERT INTO comentarios
VALUES (1, '2020-10-12 13:30:05', 'Yo tambien quiero aprender');

INSERT INTO comentarios
VALUES (1, '2020-10-14 10:15:20', 'Cuando el nuevo post?');

-- Comentarios para post de Carlos
INSERT INTO comentarios
VALUES (6, '2020-11-20 14:00:56', 'Me aclaro mis dudas');

INSERT INTO comentarios
VALUES (6, '2020-11-23 09:00:00', 'Como puedo hacer un tooltip?');

INSERT INTO comentarios
VALUES (6, '2020-11-25 04:10:02', 'Es mas facil y rapido con ese metodo');

INSERT INTO comentarios
VALUES (6, '2020-11-30 12:50:30', 'Cuando vuelves a publicar?');

-- 11.- Crear un post para "Margarita"
INSERT INTO post (id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
VALUES (7, 'Margarita', '2020-11-20', 'Aprendiendo a Programar', 'Introduccion a la Programacion', 'Titulo Margarita');

-- 12.- Ingresar 5 comentarios para el post de Margarita
INSERT INTO comentarios
VALUES (7, '2020-11-20 12:00:00', 'Estoy iniciando me ha servido mucho');

INSERT INTO comentarios
VALUES (7, '2020-11-21 15:00:10', 'Excelente video');

INSERT INTO comentarios
VALUES (7, '2020-11-24 20:39:02', 'Me gustaria saber mas, como puedo contactarte');

INSERT INTO comentarios
VALUES (7, '2020-11-25 01:20:30', 'Gracias');

INSERT INTO comentarios
VALUES (7, '2020-11-30 10:15:55', 'Bien');