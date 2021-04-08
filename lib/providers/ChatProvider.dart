import 'package:tweety_app/main.dart';
import 'package:tweety_app/models/ChatPaginator.dart';
import 'package:tweety_app/network/ApiResult.dart';
import 'package:tweety_app/network/NetworkClient.dart';
import 'package:tweety_app/providers/BaseProvider.dart';
import 'package:tweety_app/utils/NetworkExceptions.dart';

class ChatProvider extends BaseChatProvider {
  @override
  Future<ApiResult<ChatPaginator>> getChatList(int? pageNumber) async {
    try {
      final response = await locator<NetworkClient>().authClient.get('chat', queryParameters: {'page': pageNumber});

      return ApiResult<ChatPaginator>.success(data: ChatPaginator.fromJson(response['data']));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
