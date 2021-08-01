import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/user_model.dart';
import 'package:domain/src/repository/authentication_repository.dart';
import 'package:domain/src/usecase/authentication/authentication_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginUseCase)
class LoginUseCaseImpl extends LoginUseCase {
  final AuthenticationRepository _repository;

  LoginUseCaseImpl(this._repository);

  @override
  Future<Result<UserModel>> loginWithEmailAndPassword(String email, String password) =>
      _repository.loginWithEmailAndPassword(email, password);

  @override
  Future<Result<UserModel>> getUser() => _repository.getUser();
}
