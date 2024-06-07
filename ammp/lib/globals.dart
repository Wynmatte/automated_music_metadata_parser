import 'dart:io';
import 'package:path_provider/path_provider.dart';

String outputJson = ""; // contains json string used to encode to the file

// File I/O of tracks.json
class TracksFile {
  Future<String> get _localPath async {
    final directory =
        await 'C:/Users/shek/Programming/Automatic_Music_Metadata_Parser/automated_music_metadata_parser/ammp/assets';
    print(directory);
    return directory;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/tracks.json');
  }

  Future<dynamic> readTracks() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      print(contents);
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeTracks(String outputJson) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(outputJson);
  }
}
