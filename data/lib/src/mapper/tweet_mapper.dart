import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/remote/dto/tweet_response.dart';
import 'package:domain/domain.dart';

extension TweetExtension on TweetResponse {
  TweetModel toModel() => TweetModel(
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

  Tweet toEntity() => Tweet(
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

extension TweetEntityExtension on Tweet {
  TweetModel toModel() => TweetModel(
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
