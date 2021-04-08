import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweety_app/blocs/chat/Bloc.dart';
import 'package:tweety_app/models/ChatPaginator.dart';
import 'package:tweety_app/repositories/ChatRepository.dart';
import 'package:tweety_app/utils/NetworkExceptions.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({required ChatRepository repository})
      : _chatRepository = repository,
        super(const ChatState());

  final ChatRepository _chatRepository;

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is FetchChatList) {
      yield* _mapFetchChatListToState(state);
    }
  }

  Stream<ChatState> _mapFetchChatListToState(ChatState state) async* {
    if (state.hasReachedMax) yield state;

    // if (state.status == ChatStatus.initial) {
    final result = await _chatRepository.getChatList(pageNumber: 1);

    yield* result.when(success: (ChatPaginator? data) async* {
      yield state.copyWith(status: ChatStatus.success, chatList: data!.chats, hasReachedMax: data.lastPage == 1);
    }, failure: (NetworkExceptions? error) async* {
      yield state.copyWith(status: ChatStatus.failure);
    });
    // } else {
    //   final result = await _chatRepository.getChatList(pageNumber: state.pageNumber + 1);
    //
    //   yield* result.when(success: (ChatPaginator? data) async* {
    //     yield state.copyWith(status: ChatStatus.success, chatList: data!.chats, hasReachedMax: data.lastPage == 1);
    //   }, failure: (NetworkExceptions? error) async* {
    //     yield state.copyWith(status: ChatStatus.failure);
    //   });

    // return chatPaginator.chats.isEmpty
    //     ? state.copyWith(hasReachedMax: true)
    //     : state.copyWith(
    //   status: ChatStatus.success,
    //   chatList: List.of(state.chatList)
    //     ..addAll(chatPaginator.chats),
    //   hasReachedMax: false,
    // );
    // }
  }
}
