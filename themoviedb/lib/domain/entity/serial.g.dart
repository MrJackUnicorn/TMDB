// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Serial _$SerialFromJson(Map<String, dynamic> json) => Serial(
      firstAirDate: DateTime.parse(json['first_air_date'] as String),
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      posterPath: json['poster_path'] as String?,
      overview: json['overview'] as String,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      originalName: json['original_name'] as String,
      name: json['name'] as String,
      backldropPath: json['backldrop_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$SerialToJson(Serial instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'first_air_date': instance.firstAirDate.toIso8601String(),
      'origin_country': instance.originCountry,
      'overview': instance.overview,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_name': instance.originalName,
      'name': instance.name,
      'backldrop_path': instance.backldropPath,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
    };
