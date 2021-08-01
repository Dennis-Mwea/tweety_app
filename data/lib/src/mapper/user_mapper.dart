import 'package:data/src/datasource/remote/dto/login_response.dart';
import 'package:domain/domain.dart';

extension ArticleExtension on User {
  UserModel toModel() => UserModel(
        id: id,
        email: email,
        username: username,
        name: name,
        avatar: avatar,
        banner: banner,
        token: token,
        description: description,
      );
}
