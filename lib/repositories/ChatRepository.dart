import 'package:tweety_app/models/ChatPaginator.dart';
import 'package:tweety_app/network/ApiResult.dart';
import 'package:tweety_app/providers/BaseProvider.dart';
import 'package:tweety_app/providers/ChatProvider.dart';

class ChatRepository {
  BaseChatProvider chatProvider = ChatProvider();

  Future<ApiResult<ChatPaginator>> getChatList({int? pageNumber}) => chatProvider.getChatList(pageNumber!);
}
