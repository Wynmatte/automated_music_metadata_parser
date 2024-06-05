import mysql.connector
import json
import jsonify
 
'''MYSQL TO JSON'''

mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "Shekina7",
    database = "ammp"
)

cur = mydb.cursor(dictionary=True, buffered=True)

cur.execute("SELECT * FROM tracks")
rows = cur.fetchall()
tracks_data = []

"""Assign SQL to JSON"""
for row in rows:
    track_id = str(row["id"])
    # Artists
    cur.execute(
            "SELECT artist_name FROM artists INNER JOIN tracks ON artists.track_id=tracks.id WHERE track_id = %s", list(track_id))
    artist = cur.fetchone()

    # Albums
    cur.execute(
            "SELECT album_name FROM albums INNER JOIN tracks ON albums.track_id=tracks.id WHERE track_id = %s", list(track_id))
    album_name = cur.fetchone()
    cur.execute(
            "SELECT album_name FROM albums INNER JOIN tracks ON albums.track_id=tracks.id WHERE track_id = %s", list(track_id))
    album_cover = cur.fetchone()

    if artist != None:
        row.update({"artist_name" : artist["artist_name"]})
    else:
        row.update({"artist_name" : None})
    
    if album_name != None:
        row.update({"album_name" : album_name["album_name"]})
    else:
        row.update({"album_name" : None})

    if album_cover != None:
        row.update({"album_cover" : album_cover["album_cover"]})
    else:
        row.update({"album_cover" : None})

    tracks_data.append(row)


    # print(json.dumps(rows, sort_keys=True, indent=4, separators=(',', ': '), default=str))

json = json.dumps(tracks_data)
print(json)

