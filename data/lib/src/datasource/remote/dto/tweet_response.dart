import 'package:data/src/datasource/remote/dto/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tweet_response.g.dart';

@JsonSerializable()
class TweetResponse {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final String? image;
  final String body;
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @JsonKey(name: 'is_disliked')
  final bool isDisliked;
  final UserResponse user;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'replies_count')
  final int repliesCount;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'dislikes_count')
  final int dislikesCount;

  TweetResponse(this.id, this.userId, this.image, this.body, this.isLiked, this.isDisliked, this.user, this.createdAt, this.updatedAt,
      this.repliesCount, this.likesCount, this.dislikesCount);

  factory TweetResponse.fromJson(Map<String, dynamic> json) => _$TweetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TweetResponseToJson(this);
}
