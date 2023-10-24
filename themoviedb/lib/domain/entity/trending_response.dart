import 'package:flutter_application_main1/domain/entity/trending.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trending_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TrendingResponse {
  int page;
  List<Trendings> results;
  int totalPages;
  int totalResults;

  TrendingResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingResponseToJson(this);
}
