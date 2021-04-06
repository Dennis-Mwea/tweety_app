import 'package:tweety_app/models/Auth.dart';
import 'package:tweety_app/network/ApiResult.dart';

abstract class BaseProvider {}

abstract class BaseAuthenticationProvider extends BaseProvider {
  Future<bool> isSignedIn();

  Future<ApiResult<Auth>> login(String email, String password);
}
