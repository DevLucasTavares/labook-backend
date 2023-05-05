-- Active: 1683318492226@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password, role)
VALUES
  -- tipo NORMAL e senha = boymodel123
	('u001', 'Aether', 'aether@email.com', '$2a$12$X82Ds.q0xb6FYdWe88IXr.ryv.0h9ihwmuXGS9wVHtcZatO.U3tJ2', 'NORMAL'),

  -- tipo NORMAL e senha = girlmodel123
	('u002', 'Lumine', 'lumine@email.com', '$2a$12$X14usfmTC9U5/SsJV1jj4.ZSDIfueVSMQdae5/2sCDGjNcMHX47tS', 'NORMAL'),

  -- tipo ADMIN e senha = stardev99
	('u003', 'Stardev', 'stardev@email.com', '$2a$12$/WgQt9qwKh1nvTjkw2qcIu6y54bOUYRcrDucy4Z9NbHFya5Y9Q0CK', 'ADMIN');

    CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT UNIQUE NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users (id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

INSERT INTO posts ( id, creator_id, content)
VALUES
    ('p001', 'u002', 'Mario Bros film was pretty neat'),
    ('p002', 'u001', 'RE4 Remake deserves GOTY');

CREATE TABLE likes_dislikes (
  user_id TEXT NOT NULL,
  post_id TEXT NOT NULL,
  like INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO likes_dislikes (user_id, post_id, like)
VALUES
  ('u001', 'p001', 1),
  ('u003', 'p001', 1),
  ('u002', 'p002', 1),
  ('u003', 'p002', 0);

  DROP TABLE users