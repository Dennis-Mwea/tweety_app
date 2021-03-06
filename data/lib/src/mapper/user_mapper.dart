import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/remote/dto/user_response.dart';
import 'package:domain/domain.dart';

extension ArticleExtension on UserResponse {
  UserModel toModel() => UserModel(
      id: id, email: email, username: username, name: name, avatar: avatar, banner: banner, token: token, description: description);

  User toEntity() => User(name: name, id: id!, username: username, email: email, isFollowed: false);
}
