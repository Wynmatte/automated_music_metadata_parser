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



json = json.dumps(tracks_data, indent=4)
print(json)

with open("ammp/assets/tracks.json", "w") as output:
    output.write(json)

'''TODO: JSON TO MYSQL'''
import pandas
import sqlalchemy

# Watchdog file change detection of tracks.json
import watchdog.events
import watchdog.observers
import time


class Handler(watchdog.events.PatternMatchingEventHandler):
	def __init__(self):
		# Set the patterns for PatternMatchingEventHandler
		watchdog.events.PatternMatchingEventHandler.__init__(self, patterns=['*.json'],
															ignore_directories=True, case_sensitive=False)

	def on_created(self, event):
		print("Watchdog received created event - % s." % event.src_path)
		# Event is created, you can process it now

	def on_modified(self, event):
		print("Watchdog received modified event - % s." % event.src_path)
		# Event is modified, you can process it now


if __name__ == "__main__":
	src_path = "ammp/assets"
	event_handler = Handler()
	observer = watchdog.observers.Observer()
	observer.schedule(event_handler, path=src_path, recursive=True)
	observer.start()
	try:
		while True:
			time.sleep(1)
	except KeyboardInterrupt:
		observer.stop()
	observer.join()


# 