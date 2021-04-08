import 'package:tweety_app/models/Auth.dart';
import 'package:tweety_app/models/ChatPaginator.dart';
import 'package:tweety_app/models/User.dart';
import 'package:tweety_app/network/ApiResult.dart';

abstract class BaseProvider {}

abstract class BaseAuthenticationProvider extends BaseProvider {
  Future<bool> isSignedIn();

  Future<ApiResult<User>> user();

  Future<ApiResult<Auth>> login(String email, String password);
}

abstract class BaseChatProvider extends BaseProvider {
  Future<ApiResult<ChatPaginator>> getChatList(int pageNumber);
}
