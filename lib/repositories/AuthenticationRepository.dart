import 'package:tweety_app/models/Auth.dart';
import 'package:tweety_app/models/User.dart';
import 'package:tweety_app/network/ApiResult.dart';
import 'package:tweety_app/providers/AuthentocationProvider.dart';
import 'package:tweety_app/providers/BaseProvider.dart';

class AuthenticationRepository {
  BaseAuthenticationProvider authProvider = AuthenticationProvider();

  Future<bool> get isSignedIn => authProvider.isSignedIn();

  Future<ApiResult<User>> user() => authProvider.user();

  Future<ApiResult<Auth>> login(String email, String password) => authProvider.login(email, password);
}
