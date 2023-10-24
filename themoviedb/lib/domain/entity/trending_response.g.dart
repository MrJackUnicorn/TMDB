// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingResponse _$TrendingResponseFromJson(Map<String, dynamic> json) =>
    TrendingResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Trendings.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$TrendingResponseToJson(TrendingResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
