import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/user_model.dart';
import 'package:domain/src/usecase/base/base_use_case.dart';

abstract class LoginUseCase implements BaseUseCase {
  Future<Result<UserModel>> loginWithEmailAndPassword(String email, String password);

  Future<Result<UserModel>> getUser();
}
