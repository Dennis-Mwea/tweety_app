import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? id;
  final String name;
  final String username;
  final String avatar;
  final String banner;
  final String? description;
  final String email;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  const User({
    this.id,
    required this.name,
    required this.username,
    required this.banner,
    this.description,
    required this.email,
    required this.avatar,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [email];

  /// Empty user which represents an unauthenticated user.
  static const empty = User(email: '', name: '', avatar: '', username: '', banner: '');
}
