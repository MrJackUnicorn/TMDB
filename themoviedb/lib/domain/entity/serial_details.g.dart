// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serial_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerialDetails _$SerialDetailsFromJson(Map<String, dynamic> json) =>
    SerialDetails(
      backdropPath: json['backdrop_path'] as String?,
      createdBy: (json['created_by'] as List<dynamic>)
          .map((e) => CreatedBy.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeRunTime: (json['episode_run_time'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      firstAirDate:
          parseMovieDateTimeFromString(json['first_air_date'] as String?),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String,
      id: json['id'] as int,
      inProduction: json['in_production'] as bool,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      lastAirDate: json['last_air_date'] as String,
      name: json['name'] as String,
      numberOfEpisodes: json['number_of_episodes'] as int,
      numberOfSeasons: json['number_of_seasons'] as int,
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String,
      originalName: json['original_name'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      type: json['type'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      credits: SerialDetailsCredits.fromJson(
          json['credits'] as Map<String, dynamic>),
      videos:
          SerialDetailsVideos.fromJson(json['videos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SerialDetailsToJson(SerialDetails instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'created_by': instance.createdBy.map((e) => e.toJson()).toList(),
      'episode_run_time': instance.episodeRunTime,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'homepage': instance.homepage,
      'id': instance.id,
      'in_production': instance.inProduction,
      'languages': instance.languages,
      'last_air_date': instance.lastAirDate,
      'name': instance.name,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies':
          instance.productionCompanies.map((e) => e.toJson()).toList(),
      'production_countries':
          instance.productionCountries.map((e) => e.toJson()).toList(),
      'spoken_languages':
          instance.spokenLanguages.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'tagline': instance.tagline,
      'type': instance.type,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'credits': instance.credits.toJson(),
      'videos': instance.videos.toJson(),
    };

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
      id: json['id'] as int,
      creditId: json['credit_id'] as String,
      name: json['name'] as String,
      gender: json['gender'] as int,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'gender': instance.gender,
      'profile_path': instance.profilePath,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

LastEpisodeToAir _$LastEpisodeToAirFromJson(Map<String, dynamic> json) =>
    LastEpisodeToAir(
      airDate: json['air_date'] as String,
      episodeNumber: json['episode_number'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      productionCode: json['production_code'] as String,
      seasonNumber: json['season_number'] as int,
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$LastEpisodeToAirToJson(LastEpisodeToAir instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    ProductionCompany(
      name: json['name'] as String,
      id: json['id'] as int,
      logoPath: json['logo_path'] as String?,
      originCountry: json['origin_country'] as String,
    );

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'logo_path': instance.logoPath,
      'origin_country': instance.originCountry,
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    ProductionCountry(
      iso: json['iso_3166_1'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso,
      'name': instance.name,
    };

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    SpokenLanguage(
      englishName: json['english_name'] as String,
      iso: json['iso_639_1'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso,
      'name': instance.name,
    };
