// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      title: json['title'] as String,
      album_name: json['album_name'] as String?,
      album_cover: json['album_cover'] as String?,
      artist_name: json['artist_name'] as String?,
      genre: json['genre'] as String?,
      track_number: (json['track_number'] as num?)?.toInt(),
      track_year: (json['track_year'] as num?)?.toInt(),
      pace: (json['pace'] as num?)?.toInt(),
      energy: (json['energy'] as num?)?.toInt(),
      date_created: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      date_modified: json['date_modified'] == null
          ? null
          : DateTime.parse(json['date_modified'] as String),
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'title': instance.title,
      'album_name': instance.album_name,
      'album_cover': instance.album_cover,
      'artist_name': instance.artist_name,
      'genre': instance.genre,
      'track_number': instance.track_number,
      'track_year': instance.track_year,
      'pace': instance.pace,
      'energy': instance.energy,
      'date_created': instance.date_created?.toIso8601String(),
      'date_modified': instance.date_modified?.toIso8601String(),
    };
