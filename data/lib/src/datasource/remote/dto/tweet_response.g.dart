// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetResponse _$TweetResponseFromJson(Map<String, dynamic> json) {
  return TweetResponse(
    json['id'] as int,
    json['user_id'] as int,
    json['image'] as String?,
    json['body'] as String,
    json['is_liked'] as bool,
    json['is_disliked'] as bool,
    UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    json['created_at'] as String,
    json['updated_at'] as String,
    json['replies_count'] as int,
    json['likes_count'] as int,
    json['dislikes_count'] as int,
  );
}

Map<String, dynamic> _$TweetResponseToJson(TweetResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image': instance.image,
      'body': instance.body,
      'is_liked': instance.isLiked,
      'is_disliked': instance.isDisliked,
      'user': instance.user,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'replies_count': instance.repliesCount,
      'likes_count': instance.likesCount,
      'dislikes_count': instance.dislikesCount,
    };
