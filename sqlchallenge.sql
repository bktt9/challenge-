CREATE TABLE users (
	id INT PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(255) NOT NULL,
	created_at DATE NOT NULL
);

CREATE TABLE artists (
	id INT PRIMARY KEY,
     user_id INT,
	artist_name VARCHAR(100),
	tagline VARCHAR(255) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE tracks (
	id serial PRIMARY KEY,
	artist_id INT NOT NULL,
	name VARCHAR(255) NOT NULL,
	isrc VARCHAR(12),
	FOREIGN KEY (artist_id) REFERENCES artists (id)
);


INSERT INTO users (id, username, email, created_at) VALUES (1,'Ricardo Fernandez', 'rfernandez@mocionweb.com', NOW()), (2, 'Vicente Fernandez', 'vicente@mocionweb.com', NOW()), (3, 'Juan Gabriel', 'juang@mocionweb.com', NOW());

INSERT INTO artists (id, user_id, artist_name, tagline) VALUES (1, 2, 'Chente', 'Arriva las chivas'), (2, 3,'Juanga', 'Vámos al Noa Noa');
INSERT INTO artists (id, artist_name, tagline) VALUES (3,'José José', 'Príncipe de la canción');


INSERT INTO tracks (id, artist_id, name, isrc) VALUES (1, 1, 'Mujeres Divinas', 'ISRC1'), (2, 1, 'Cruz de tu olvido', 'ISRC2'), (3, 2, 'Hasta que te conocí', 'ISRC3');

-- If an artist has multiple tracks, return one row per track
-- If an artist does not have any tracks, still return the user and artist data but leave the track data blank 

SELECT a.user_id, u.username, u.email, a.id as artist_id, a.tagline, t.name as track_name, t.isrc as track_isrc 
	FROM artists a 
		LEFT JOIN tracks t ON t.artist_id = a.id 
        LEFT JOIN users u ON u.id = a.user_id;


