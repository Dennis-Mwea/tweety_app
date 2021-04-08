import 'package:json_annotation/json_annotation.dart';
import 'package:tweety_app/models/Chat.dart';

part 'ChatPaginator.g.dart';

@JsonSerializable()
class ChatPaginator {
  @JsonKey(name: 'current_page')
  int currentPage;

  @JsonKey(name: 'last_page')
  int lastPage;

  @JsonKey(name: 'data')
  List<Chat> chats;

  ChatPaginator({required this.currentPage, required this.lastPage, required this.chats});

  factory ChatPaginator.fromJson(Map<String, dynamic> json) => _$ChatPaginatorFromJson(json);

  Map<String, dynamic> toJson() => _$ChatPaginatorToJson(this);
}
