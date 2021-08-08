import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/remote/dto/article_response.dart';
import 'package:domain/domain.dart';

extension ArticleExtension on ArticleModelResponse {
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

  Article toEntity() => Article(
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

extension ArticleEntityExtension on Article {
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
