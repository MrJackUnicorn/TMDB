// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trendings _$TrendingsFromJson(Map<String, dynamic> json) => Trendings(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      releaseDate: DateTime.parse(json['release_date'] as String),
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      popularity: (json['popularity'] as num).toDouble(),
      firstAirDate: json['first_air_date'] == null
          ? null
          : DateTime.parse(json['first_air_date'] as String),
      name: json['name'] as String?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalName: json['original_name'] as String?,
    );

Map<String, dynamic> _$TrendingsToJson(Trendings instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'popularity': instance.popularity,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'name': instance.name,
      'origin_country': instance.originCountry,
      'original_name': instance.originalName,
    };
