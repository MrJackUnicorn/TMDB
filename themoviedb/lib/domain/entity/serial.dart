import 'package:json_annotation/json_annotation.dart';

part 'serial.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Serial {
  final String? posterPath;
  final double popularity;
  final DateTime firstAirDate;
  final List<String> originCountry;
  final String overview;
  final List<int> genreIds;
  final int id;
  final String originalName;
  final String name;
  final String? backldropPath;
  final int voteCount;

  final double voteAverage;

  Serial({
    required this.firstAirDate,
    required this.originCountry,
    required this.posterPath,
    required this.overview,
    required this.genreIds,
    required this.id,
    required this.originalName,
    required this.name,
    required this.backldropPath,
    required this.popularity,
    required this.voteCount,
    required this.voteAverage,
  });

  factory Serial.fromJson(Map<String, dynamic> json) => _$SerialFromJson(json);

  Map<String, dynamic> toJson() => _$SerialToJson(this);
}
