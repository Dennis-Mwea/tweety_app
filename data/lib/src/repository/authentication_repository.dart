import 'package:data/src/datasource/remote/dto/base/base_response.dart' as ApiResponse;
import 'package:data/src/datasource/remote/dto/user_response.dart';
import 'package:data/src/datasource/remote/service/authentication_service.dart';
import 'package:data/src/mapper/user_mapper.dart';
import 'package:data/src/repository/base/base_repository.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends BaseResponse implements AuthenticationRepository {
  final AuthenticationService _authenticationService;

  AuthenticationRepositoryImpl(this._authenticationService);

  @override
  Future<Result<UserModel>> loginWithEmailAndPassword(String email, String password) {
    return safeApiCall(_authenticationService.loginWithEmailAndPassword({'email': email, 'password': password}),
        mapper: (ApiResponse.BaseResponse<UserResponse> response) => response.data.toModel());
  }

  @override
  Future<Result<UserModel>> getUser() {
    return safeApiCall(_authenticationService.getUser(),
        mapper: (ApiResponse.BaseResponse<UserResponse> response) => response.data.toModel());
  }
}
