'''TODO: JSON TO MYSQL'''
import pandas
import pandas as pd
import sqlalchemy
import mysql.connector

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
		# for each row in df
			#	for each cell, compare to corresponding sql column
			# 	if there are differences, change them according to json update
			#   if row does not exist, insert into tracks, album, artist
			# 	(optional for now) if track is deleted, delete row in sql
		for index, row in df.iterrows():
			for column in df:
				print(column)
				if column != "id":	
					cur.execute("SELECT id FROM tracks WHERE id = %s", list(str(row['id'])))
					id = cur.fetchone
					if id != None:
						try:
							cur.execute(f"""UPDATE tracks SET `{column}` = "{row[column]}" WHERE id = {str(row['id'])}""")
							cur.execute(f"""SELECT `{column}` FROM tracks WHERE id = {str(row['id'])}""")
							c = cur.fetchone()
							print(c)
						except KeyError:
							try:
								cur.execute(f"""UPDATE artists SET {column} = (%s) WHERE id = %s""", (column, str(row[column]), (str(row['id']))))
								c = cur.fetchone()
								print(c)
							except KeyError:
								cur.execute("UPDATE albums SET (%s) = (%s) WHERE id = %s", (column, str(row[column]), (str(row['id']))))
								c = cur.fetchone()
								print(c)
					else:
						pass
					# insert when does not exist
						# try:
						# 	cur.execute("INSERT INTO tracks (%s) VALUES (%s) WHERE id = %s", (column, str(row[column]), (str(row['id']))))
						# 	c = cur.fetchone()
						# 	print(c)
						# except KeyError:		
						# 	try:
						# 		cur.execute("INSERT INTO artists (%s) VALUES (%s) WHERE id = %s", column, str(row[column]), list(str(row['id'])))
						# 		c = cur.fetchone()
						# 		print(c)
						# 	except KeyError:
						# 		cur.execute("INSERT INTO albums (%s) VALUES (%s) WHERE id = %s", column, (str(row[column])), list(str(row['id'])))
						# 		c = cur.fetchone()
						# 		print(c)
					

		
        

        


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
