import 'package:tweety_app/config/Constants.dart';
import 'package:tweety_app/models/Auth.dart';
import 'package:tweety_app/models/User.dart';
import 'package:tweety_app/network/ApiResult.dart';
import 'package:tweety_app/providers/BaseProvider.dart';
import 'package:tweety_app/utils/NetworkExceptions.dart';
import 'package:tweety_app/utils/SharedObjects.dart';

class AuthenticationProvider extends BaseAuthenticationProvider {
  @override
  Future<bool> isSignedIn() async {
    return SharedObjects.prefs.getString(Constants.accessToken) != null;
  }

  @override
  Future<ApiResult<Auth>> login(String email, String password) async {
    try {
      // final response = await locator<NetworkClient>().client.post('login', data: {'email': email, 'password': password});
      // final auth = Auth.fromJson(response['data']);
      //
      // await SharedObjects.prefs.setString(Constants.accessToken, auth.token);

      return ApiResult<Auth>.success(data: null);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<User>> user() async {
    try {
      // final response = await locator<NetworkClient>().authClient.get('profile');
      // final user = User.fromJson(response['data']);

      return ApiResult<User>.success(data: null);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
