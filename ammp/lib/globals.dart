// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:sqflite/sqflite.dart';

class Track {
  int? id;
  String? title;
  String? genre;
  double? pace;
  double? energy;
  int? track_year;
  int? track_number;
  dynamic? date_created;
  dynamic? date_modified;
  String? artist_name;
  String? album_name;
  String? cover;

  Track(
      {this.id,
      this.title,
      this.genre,
      this.pace,
      this.energy,
      this.track_year,
      this.track_number,
      this.date_created,
      this.date_modified,
      this.artist_name,
      this.album_name,
      this.cover});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'genre': genre,
      'pace': pace,
      'energy': energy,
      'track_year': track_year,
      'track_number': track_number,
      'date_created': date_created,
      'date_modified': date_modified,
      'artist_name': artist_name,
      'album_name': album_name,
      'cover': cover,
    };
  }
}

Future<List<Track>> get_tracks(Database db) async {
  final List<Map<String, Object?>> trackMaps = await db.query('tracks');

  List<Track> tracks = [];
  for (final {
        'id': id as int,
        'title': title as String?,
        'genre': genre as String?,
        'pace': pace as double?,
        'energy': energy as double?,
        'track_year': track_year as int?,
        'track_number': track_number as int?,
        'date_created': date_created as dynamic?,
        'date_modified': date_modified as dynamic?
      } in trackMaps) {

      // TODO: TRY TO MAKE THIS CONCISE LATER
    List<Map<String, Object?>> artist_name_query = await db.query('artists',
        columns: ['artist_name'], where: 'track_id = ?', whereArgs: [id]);
    String? artist_name;
    artist_name_query.first.forEach((key, value) {
      artist_name = value.toString();
    });
    List<Map<String, Object?>> album_name_query = await db.query('albums',
        columns: ['album_name'], where: 'track_id = ?', whereArgs: [id]);
    String? album_name;
    album_name_query.first.forEach((key, value) {
      album_name = value.toString();
    });
    List<Map<String, Object?>> cover_query = await db.query('albums',
        columns: ['cover'], where: 'track_id = ?', whereArgs: [id]);
    String? cover;
    cover_query.first.forEach((key, value) {
      cover = value.toString();
    });

    tracks.add(Track(
        id: id,
        title: title,
        genre: genre,
        pace: pace,
        energy: energy,
        track_year: track_year,
        track_number: track_number,
        date_created: date_created,
        date_modified: date_modified,
        artist_name: artist_name,
        album_name: album_name,
        cover: cover));
  }
  return tracks;
}




































