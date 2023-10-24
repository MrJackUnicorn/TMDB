// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serial_details_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerialDetailsVideos _$SerialDetailsVideosFromJson(Map<String, dynamic> json) =>
    SerialDetailsVideos(
      results: (json['results'] as List<dynamic>)
          .map((e) =>
              SerialDetailsVideosResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SerialDetailsVideosToJson(
        SerialDetailsVideos instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

SerialDetailsVideosResult _$SerialDetailsVideosResultFromJson(
        Map<String, dynamic> json) =>
    SerialDetailsVideosResult(
      official: json['official'] as bool,
      publishedAt: json['published_at'] as String,
      id: json['id'] as String,
      iso6391: json['iso_639_1'] as String,
      iso31661: json['iso_3166_1'] as String,
      key: json['key'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      size: json['size'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$SerialDetailsVideosResultToJson(
        SerialDetailsVideosResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'key': instance.key,
      'name': instance.name,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
    };
