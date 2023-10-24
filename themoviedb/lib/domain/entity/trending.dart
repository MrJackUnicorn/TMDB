import 'package:json_annotation/json_annotation.dart';

part 'trending.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Trendings {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  // OriginalLanguage originalLanguage;
  String originalTitle;
  String overview;
  String? posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  double popularity;
  DateTime? firstAirDate;
  String? name;
  List<String>? originCountry;
  String? originalName;

  Trendings({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    // required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.firstAirDate,
    required this.name,
    required this.originCountry,
    required this.originalName,
  });
  factory Trendings.fromJson(Map<String, dynamic> json) =>
      _$TrendingsFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingsToJson(this);
}

// enum OriginalLanguage { EN, RU }

// final originalLanguageValues =
//     EnumValues({"en": OriginalLanguage.EN, "ru": OriginalLanguage.RU});

// @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }

//   factory EnumValues.fromJson(Map<String, dynamic> json) =>
//       _$EnumValuesFromJson(json);

//   Map<String, dynamic> toJson() => _$EnumValuesToJson(this);
// }
