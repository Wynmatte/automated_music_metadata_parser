import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class Track {
  /// The generated code assumes these values exist in JSON.
  String title;
  String? album_name, album_cover, artist_name, genre;
  int? track_number, track_year, pace, energy;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime? date_created, date_modified;

  Track(
      {required this.title,
      this.album_name,
      this.album_cover,
      this.artist_name,
      this.genre,
      this.track_number,
      this.track_year,
      this.pace,
      this.energy,
      this.date_created,
      this.date_modified});

  /// Connect the generated [_$TracksFromJson] function to the `fromJson`
  /// factory.
  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  /// Connect the generated [_$TrackToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
