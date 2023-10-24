import 'package:json_annotation/json_annotation.dart';

part 'serial_details_videos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SerialDetailsVideos {
  // final int id;
  final List<SerialDetailsVideosResult> results;
  SerialDetailsVideos({
    // required this.id,
    required this.results,
  });

  factory SerialDetailsVideos.fromJson(Map<String, dynamic> json) =>
      _$SerialDetailsVideosFromJson(json);

  Map<String, dynamic> toJson() => _$SerialDetailsVideosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SerialDetailsVideosResult {
  final String id;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;

  SerialDetailsVideosResult({
    required this.official,
    required this.publishedAt,
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
  });

  factory SerialDetailsVideosResult.fromJson(Map<String, dynamic> json) =>
      _$SerialDetailsVideosResultFromJson(json);

  Map<String, dynamic> toJson() => _$SerialDetailsVideosResultToJson(this);
}
