import 'package:data/src/datasource/local/dao/user_dao.dart';
import 'package:data/src/datasource/remote/dto/login_response.dart';
import 'package:data/src/datasource/remote/service/authentication_service.dart';
import 'package:data/src/mapper/user_mapper.dart';
import 'package:data/src/repository/base/base_repository.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends BaseResponse implements AuthenticationRepository {
  final AuthenticationService _authenticationService;
  final TagDao _tagDao;

  AuthenticationRepositoryImpl(this._authenticationService, this._tagDao);

  @override
  Future<Result<UserModel>> loginWithEmailAndPassword(String email, String password) {
    return safeApiCall(_authenticationService.loginWithEmailAndPassword({'email': email, 'password': password}),
        mapper: (LoginResponse response) => response.user.toModel());
  }

  @override
  Future<Result<UserModel>> getUser() {
    return safeApiCall(_authenticationService.getUser(), mapper: (LoginResponse response) => response.user.toModel());
  }
}
