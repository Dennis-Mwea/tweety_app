import 'package:json_annotation/json_annotation.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'first_page_url')
  final String? firstPageUrl;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'last_page_url')
  final String? lastPageUrl;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  final String path;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'previous_page_url')
  final String? previousPageUrl;
  final int to;
  final int total;
  @JsonKey(name: 'data')
  final List<ArticleModelResponse> articles;

  ArticleResponse(this.articles, this.currentPage, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.nextPageUrl,
      this.path, this.perPage, this.previousPageUrl, this.to, this.total);

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}

@JsonSerializable()
class ArticleModelResponse {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final String? image;
  final String body;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @JsonKey(name: 'is_disliked')
  final bool isDisliked;
  @JsonKey(name: 'replies_count')
  final int repliesCount;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'dislikes_count')
  final int dislikesCount;

  ArticleModelResponse(this.id, this.userId, this.image, this.body, this.createdAt, this.updatedAt, this.isLiked, this.isDisliked,
      this.repliesCount, this.likesCount, this.dislikesCount);

  factory ArticleModelResponse.fromJson(Map<String, dynamic> json) => _$ArticleModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelResponseToJson(this);
}

@JsonSerializable()
class Media {
  @JsonKey(name: 'media-metadata')
  final List<MediaMetaData>? mediaMetadata;

  Media(this.mediaMetadata);

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
class MediaMetaData {
  final String url;

  MediaMetaData(this.url);

  factory MediaMetaData.fromJson(Map<String, dynamic> json) => _$MediaMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MediaMetaDataToJson(this);
}
