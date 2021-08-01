import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/user_model.dart';

abstract class AuthenticationRepository {
  Future<Result<UserModel>> loginWithEmailAndPassword(String email, String password);
}
