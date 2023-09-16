import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unlimit_joke_response.g.dart';

@JsonSerializable()
@CopyWith()
class UnLimitJokeResponse {
  final String? joke;
  const UnLimitJokeResponse({
    this.joke,
  });

  factory UnLimitJokeResponse.fromJson(Map<String, Object?> json) => _$UnLimitJokeResponseFromJson(json);

  @override Map<String, dynamic> toJson() => _$UnLimitJokeResponseToJson(this);
}