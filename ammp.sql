CREATE TABLE tracks (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	title TEXT NOT NULL,
    genre TEXT,
    pace NUMERIC,
    energy NUMERIC,
    track_year TEXT,
    track_number INTEGER,
    date_created DATETIME,
    date_modified DATETIME 
    
);

CREATE TABLE artists (
	artist_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    track_id INTEGER UNIQUE NOT NULL,
    artist_name TEXT,
	FOREIGN KEY(track_id) REFERENCES tracks(id)
);

CREATE TABLE albums (
	album_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    track_id INTEGER UNIQUE NOT NULL,
    artist_id INTEGER UNIQUE NOT NULL,
    album_name TEXT,
    cover TEXT,
    FOREIGN KEY(track_id) REFERENCES tracks(id),
    FOREIGN KEY(artist_id) REFERENCES artists(artist_id)

);

# Sample Queries
INSERT INTO tracks (title, genre) 
VALUES  ("Silver Children", "Psychedelic Rock"),
		("My Generation", "Garage Rock");
        
SELECT * FROM tracks;

INSERT INTO artists (artist_name) 
VALUES  ("Front Page Review"),
		("The Who");
DELETE FROM artists WHERE artist_ID = 2;

SELECT * FROM artists;

ALTER TABLE artists MODIFY track_id INTEGER NOT NULL;
ALTER TABLE album MODIFY track_id INTEGER NOT NULL;
ALTER TABLE album MODIFY artist_id INTEGER NOT NULL;
