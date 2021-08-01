class UserModel {
  final int? id;
  final String name;
  final String username;
  final String avatar;
  final String banner;
  final String? description;
  final String email;
  final String? token;

  const UserModel({
    this.id,
    required this.name,
    required this.username,
    required this.banner,
    this.description,
    required this.email,
    required this.avatar,
    this.token,
  });

  /// Empty user which represents an unauthenticated user.
  static const empty = UserModel(email: '', name: '', avatar: '', username: '', banner: '');

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(name: json['name'], username: json['username'], banner: json['banner'], email: json['email'], avatar: json['avatar']);

  Map<String, dynamic> toJson() =>
      {'email': email, 'name': name, 'username': username, 'avatar': avatar, 'banner': banner, 'description': description};
}
