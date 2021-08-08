// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return ArticleResponse(
    (json['data'] as List<dynamic>)
        .map((e) => ArticleModelResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['current_page'] as int,
    json['first_page_url'] as String?,
    json['from'] as int?,
    json['last_page'] as int?,
    json['last_page_url'] as String?,
    json['next_page_url'] as String?,
    json['path'] as String,
    json['per_page'] as int,
    json['previous_page_url'] as String?,
    json['to'] as int,
    json['total'] as int,
  );
}

Map<String, dynamic> _$ArticleResponseToJson(ArticleResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'previous_page_url': instance.previousPageUrl,
      'to': instance.to,
      'total': instance.total,
      'data': instance.articles,
    };

ArticleModelResponse _$ArticleModelResponseFromJson(Map<String, dynamic> json) {
  return ArticleModelResponse(
    json['id'] as int,
    json['user_id'] as int,
    json['image'] as String?,
    json['body'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['is_liked'] as bool,
    json['is_disliked'] as bool,
    json['replies_count'] as int,
    json['likes_count'] as int,
    json['dislikes_count'] as int,
  );
}

Map<String, dynamic> _$ArticleModelResponseToJson(
        ArticleModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image': instance.image,
      'body': instance.body,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_liked': instance.isLiked,
      'is_disliked': instance.isDisliked,
      'replies_count': instance.repliesCount,
      'likes_count': instance.likesCount,
      'dislikes_count': instance.dislikesCount,
    };

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    (json['media-metadata'] as List<dynamic>?)
        ?.map((e) => MediaMetaData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'media-metadata': instance.mediaMetadata,
    };

MediaMetaData _$MediaMetaDataFromJson(Map<String, dynamic> json) {
  return MediaMetaData(
    json['url'] as String,
  );
}

Map<String, dynamic> _$MediaMetaDataToJson(MediaMetaData instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
