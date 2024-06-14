import sqlite3
 
'''WHEN AMMP IS FIRST LAUNCHED'''
db = sqlite3.connect("tracks.db")

cursor = db.cursor()
cursor.execute(f"""CREATE TABLE IF NOT EXISTS tracks (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT NOT NULL,
    genre TEXT,
    pace NUMERIC,
    energy NUMERIC,
    track_year TEXT,
    track_number INTEGER,
    date_created DATETIME,
    date_modified DATETIME 
)
""")
cursor.execute(f"""CREATE TABLE IF NOT EXISTS artists (
	artist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    track_id INTEGER UNIQUE NOT NULL,
    artist_name TEXT,
	FOREIGN KEY(track_id) REFERENCES tracks(id)
)""")
cursor.execute(f"""CREATE TABLE IF NOT EXISTS albums (
	album_id INTEGER PRIMARY KEY AUTOINCREMENT,
    track_id INTEGER UNIQUE NOT NULL,
    artist_id INTEGER UNIQUE NOT NULL,
    album_name TEXT,
    cover TEXT,
    FOREIGN KEY(track_id) REFERENCES tracks(id),
    FOREIGN KEY(artist_id) REFERENCES artists(artist_id)
)""")

cursor.execute(f"""INSERT INTO tracks (title, genre) VALUES ('Silver Children', 'Psychedelic Rock')""")

cursor.execute("SELECT id FROM tracks WHERE title = 'Silver Children'")
id = cursor.fetchone
track_id = cursor.lastrowid
db.commit()
cursor.execute(f"""INSERT INTO artists (artist_name, track_id) VALUES ('Front Page Review', ?)""", (track_id, ))
db.commit()
cursor.execute(f"""INSERT INTO albums (album_name, track_id, artist_id) VALUES ('Mystic Soldiers', ?, ?)""", (track_id, cursor.lastrowid))
db.commit()








