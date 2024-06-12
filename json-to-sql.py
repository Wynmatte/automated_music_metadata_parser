'''TODO: JSON TO MYSQL'''
import pandas
import pandas as pd
import sqlalchemy
import mysql.connector
import numpy as np
import pymysql

# Watchdog file change detection of tracks.json
import watchdog.events
import watchdog.observers
import time
from decimal import *

pd.set_option('display.max_columns', None)

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
		# Convert json to dataframe
		df = pandas.read_json("ammp/assets/tracks.json")
		df = df.replace(np.nan, pymysql.NULL)
		# for each row in df
			#	for each cell, compare to corresponding sql column
			# 	if there are differences, change them according to json update
			# 	(optional for now) if track is deleted, delete row in sql
		for index, row in df.iterrows():
			cur.execute("SELECT id FROM tracks WHERE id = %s", list(str(row['id'])))
			id = cur.fetchone
			# tracks_cols = ("id", "title", "genre", "pace", "energy",
			# 	  "track_year", "track_number", "date_created",
			# 	   "date_modified" )
			# tracks_args = (
			# 	row["id"],
			# 	row["title"],
			# 	row["genre"],
			# 	row["pace"],
			# 	row["energy"],
			# 	row["track_year"],
			# 	row["track_number"],
			# 	row["date_created"],					
			# 	row["date_modified"])
			
			# artists_cols = ('artist_name', 'artist_id', 'track_id')
			# artists_args = (
			# 	row['artist_name'],
			# 	row['artist_id'],
			# 	row['track_id'])
			
			# albums_cols = ('album_id', 'track_id', 'artist_id', 'album_name', 'cover')
			# albums_args = (
			# 	row['album_id'], 
			# 	row['track_id'], 
			# 	row['artist_id'], 
			# 	row['album_name'], 
			# 	row['album_cover'])

			# If track exists (based on track id)
			if id != None:
				cur.execute(f"""
				UPDATE `tracks` SET 
				title = "{row["title"]}", 
				genre = "{row["genre"]}",  
				pace = {row["pace"]},
				energy = {row["energy"]},
				track_year = {row["track_year"]},
				track_number = {row["track_number"]},
				date_created = {row["date_created"]},
				date_modified = {row["date_modified"]}
				WHERE id = {row["id"]}
				""",
				)
				mydb.commit()

				cur.execute(f"""
				UPDATE artists SET 
				artist_name = "{row["artist_name"]}"
				""",
				)
				mydb.commit()

				# updates artist_id so that it is has the same id when artist names are the same
				cur.execute(f"""UPDATE artists SET 
							artist_id=(SELECT artist_id FROM artists 
							WHERE artist_name = "{row["artist_name"]}")
							WHERE track_id = {row["track_id"]}""")
				mydb.commit()
				
				cur.execute(f"""
				UPDATE albums SET 
				artist_id = {row["artist_id"]}
				album_name = "{row["album_name"]}"
				cover = "{row["cover"]}"
				""",
				)

					

		
        

        


if __name__ == "__main__":
	engine = sqlalchemy.create_engine('mysql+mysqlconnector://root:Shekina7@localhost:3306/ammp', echo=True)
	temp_engine = sqlalchemy.create_engine('mysql+mysqlconnector://root:Shekina7@localhost:3306/ammp', echo=True)
	
	mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "Shekina7",
    database = "ammp"
	)

	cur = mydb.cursor(dictionary=True, buffered=True)
	
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
