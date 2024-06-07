'''TODO: JSON TO MYSQL'''
import pandas
import pandas as pd
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
		# Convert json to dataframe
		data = pandas.read_json("ammp/assets/tracks.json")
		print(data)
        

        


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
