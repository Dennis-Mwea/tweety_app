import 'package:domain/domain.dart';

class TweetModel {
  final int id;
  final int userId;
  final String? image;
  final String body;
  final String createdAt;
  final String updatedAt;
  final bool isLiked;
  final bool isDisliked;
  final int repliesCount;
  final int likesCount;
  final int dislikesCount;
  final UserModel? user;

  TweetModel(
      {required this.id,
      required this.userId,
      this.image,
      required this.body,
      required this.createdAt,
      required this.updatedAt,
      required this.isLiked,
      required this.isDisliked,
      required this.repliesCount,
      required this.likesCount,
      required this.dislikesCount,
      this.user});
}
