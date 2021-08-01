import 'package:data/src/datasource/local/entity/article_entity.dart';
import 'package:data/src/datasource/remote/dto/article_response.dart';
import 'package:domain/domain.dart';

extension ArticleExtension on Article {
  ArticleModel toModel() => ArticleModel(
      id: id,
      userId: userId,
      image: image,
      body: body,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isLiked: isLiked,
      isDisliked: isDisliked,
      repliesCount: repliesCount,
      likesCount: likesCount,
      dislikesCount: dislikesCount);

  ArticleEntity toEntity() => ArticleEntity(
      id: id,
      userId: userId,
      image: image,
      body: body,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isLiked: isLiked,
      isDisliked: isDisliked,
      repliesCount: repliesCount,
      likesCount: likesCount,
      dislikesCount: dislikesCount);
}

extension ArticleEntityExtension on ArticleEntity {
  ArticleModel toModel() => ArticleModel(
      id: id,
      userId: userId,
      image: image,
      body: body,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isLiked: isLiked,
      isDisliked: isDisliked,
      repliesCount: repliesCount,
      likesCount: likesCount,
      dislikesCount: dislikesCount);
}
