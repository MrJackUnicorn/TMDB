import 'package:flutter_application_main1/domain/entity/movie_data_parser.dart';
import 'package:flutter_application_main1/domain/entity/serial_details_credits.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_application_main1/domain/entity/serial_details_videos.dart';
part 'serial_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SerialDetails {
  final String? backdropPath;
  final List<CreatedBy> createdBy;
  final List<int> episodeRunTime;
  @JsonKey(fromJson: parseMovieDateTimeFromString)
  final DateTime? firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;
  final SerialDetailsCredits credits;
  final SerialDetailsVideos videos;

  SerialDetails(
      {required this.backdropPath,
      required this.createdBy,
      required this.episodeRunTime,
      required this.firstAirDate,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.inProduction,
      required this.languages,
      required this.lastAirDate,
      required this.name,
      required this.numberOfEpisodes,
      required this.numberOfSeasons,
      required this.originCountry,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.productionCompanies,
      required this.productionCountries,
      required this.spokenLanguages,
      required this.status,
      required this.tagline,
      required this.type,
      required this.voteAverage,
      required this.voteCount,
      required this.credits,
      required this.videos});
  factory SerialDetails.fromJson(Map<String, dynamic> json) =>
      _$SerialDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SerialDetailsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CreatedBy {
  int id;
  String creditId;
  String name;
  int gender;
  String? profilePath;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    required this.profilePath,
  });
  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LastEpisodeToAir {
  String airDate;
  int episodeNumber;
  int id;
  String name;
  String overview;
  String productionCode;
  int seasonNumber;
  String? stillPath;
  double voteAverage;
  int voteCount;

  LastEpisodeToAir({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });
  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirFromJson(json);

  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompany {
  String name;
  int id;
  String? logoPath;
  String originCountry;

  ProductionCompany({
    required this.name,
    required this.id,
    this.logoPath,
    required this.originCountry,
  });
  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  String iso;
  String name;

  ProductionCountry({
    required this.iso,
    required this.name,
  });
  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SpokenLanguage {
  String englishName;
  @JsonKey(name: 'iso_639_1')
  String iso;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso,
    required this.name,
  });
  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
