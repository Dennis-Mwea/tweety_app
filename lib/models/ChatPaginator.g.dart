// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatPaginator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatPaginator _$ChatPaginatorFromJson(Map<String, dynamic> json) {
  return ChatPaginator(
    currentPage: json['current_page'] as int,
    lastPage: json['last_page'] as int,
    chats: (json['data'] as List<dynamic>)
        .map((e) => Chat.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ChatPaginatorToJson(ChatPaginator instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'data': instance.chats,
    };
