// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String username;
  final String? description;
  final String? avatar;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? followsCount;
  final int? followersCount;
  final bool isFollowed;
  User(
      {required this.id,
      required this.name,
      required this.username,
      this.description,
      this.avatar,
      required this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.followsCount,
      this.followersCount,
      required this.isFollowed});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      emailVerifiedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email_verified_at']),
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      followsCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}follows_count']),
      followersCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}followers_count']),
      isFollowed: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_followed'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String?>(avatar);
    }
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || emailVerifiedAt != null) {
      map['email_verified_at'] = Variable<DateTime?>(emailVerifiedAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime?>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime?>(updatedAt);
    }
    if (!nullToAbsent || followsCount != null) {
      map['follows_count'] = Variable<int?>(followsCount);
    }
    if (!nullToAbsent || followersCount != null) {
      map['followers_count'] = Variable<int?>(followersCount);
    }
    map['is_followed'] = Variable<bool>(isFollowed);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      username: Value(username),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      email: Value(email),
      emailVerifiedAt: emailVerifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(emailVerifiedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      followsCount: followsCount == null && nullToAbsent
          ? const Value.absent()
          : Value(followsCount),
      followersCount: followersCount == null && nullToAbsent
          ? const Value.absent()
          : Value(followersCount),
      isFollowed: Value(isFollowed),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
      description: serializer.fromJson<String?>(json['description']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      email: serializer.fromJson<String>(json['email']),
      emailVerifiedAt: serializer.fromJson<DateTime?>(json['emailVerifiedAt']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      followsCount: serializer.fromJson<int?>(json['followsCount']),
      followersCount: serializer.fromJson<int?>(json['followersCount']),
      isFollowed: serializer.fromJson<bool>(json['isFollowed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
      'description': serializer.toJson<String?>(description),
      'avatar': serializer.toJson<String?>(avatar),
      'email': serializer.toJson<String>(email),
      'emailVerifiedAt': serializer.toJson<DateTime?>(emailVerifiedAt),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'followsCount': serializer.toJson<int?>(followsCount),
      'followersCount': serializer.toJson<int?>(followersCount),
      'isFollowed': serializer.toJson<bool>(isFollowed),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          String? username,
          String? description,
          String? avatar,
          String? email,
          DateTime? emailVerifiedAt,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? followsCount,
          int? followersCount,
          bool? isFollowed}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        description: description ?? this.description,
        avatar: avatar ?? this.avatar,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        followsCount: followsCount ?? this.followsCount,
        followersCount: followersCount ?? this.followersCount,
        isFollowed: isFollowed ?? this.isFollowed,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('description: $description, ')
          ..write('avatar: $avatar, ')
          ..write('email: $email, ')
          ..write('emailVerifiedAt: $emailVerifiedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('followsCount: $followsCount, ')
          ..write('followersCount: $followersCount, ')
          ..write('isFollowed: $isFollowed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              username.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      avatar.hashCode,
                      $mrjc(
                          email.hashCode,
                          $mrjc(
                              emailVerifiedAt.hashCode,
                              $mrjc(
                                  createdAt.hashCode,
                                  $mrjc(
                                      updatedAt.hashCode,
                                      $mrjc(
                                          followsCount.hashCode,
                                          $mrjc(followersCount.hashCode,
                                              isFollowed.hashCode))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.username == this.username &&
          other.description == this.description &&
          other.avatar == this.avatar &&
          other.email == this.email &&
          other.emailVerifiedAt == this.emailVerifiedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.followsCount == this.followsCount &&
          other.followersCount == this.followersCount &&
          other.isFollowed == this.isFollowed);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> username;
  final Value<String?> description;
  final Value<String?> avatar;
  final Value<String> email;
  final Value<DateTime?> emailVerifiedAt;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int?> followsCount;
  final Value<int?> followersCount;
  final Value<bool> isFollowed;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.description = const Value.absent(),
    this.avatar = const Value.absent(),
    this.email = const Value.absent(),
    this.emailVerifiedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.followsCount = const Value.absent(),
    this.followersCount = const Value.absent(),
    this.isFollowed = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String username,
    this.description = const Value.absent(),
    this.avatar = const Value.absent(),
    required String email,
    this.emailVerifiedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.followsCount = const Value.absent(),
    this.followersCount = const Value.absent(),
    this.isFollowed = const Value.absent(),
  })  : name = Value(name),
        username = Value(username),
        email = Value(email);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? username,
    Expression<String?>? description,
    Expression<String?>? avatar,
    Expression<String>? email,
    Expression<DateTime?>? emailVerifiedAt,
    Expression<DateTime?>? createdAt,
    Expression<DateTime?>? updatedAt,
    Expression<int?>? followsCount,
    Expression<int?>? followersCount,
    Expression<bool>? isFollowed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (description != null) 'description': description,
      if (avatar != null) 'avatar': avatar,
      if (email != null) 'email': email,
      if (emailVerifiedAt != null) 'email_verified_at': emailVerifiedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (followsCount != null) 'follows_count': followsCount,
      if (followersCount != null) 'followers_count': followersCount,
      if (isFollowed != null) 'is_followed': isFollowed,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? username,
      Value<String?>? description,
      Value<String?>? avatar,
      Value<String>? email,
      Value<DateTime?>? emailVerifiedAt,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int?>? followsCount,
      Value<int?>? followersCount,
      Value<bool>? isFollowed}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      followsCount: followsCount ?? this.followsCount,
      followersCount: followersCount ?? this.followersCount,
      isFollowed: isFollowed ?? this.isFollowed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String?>(avatar.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (emailVerifiedAt.present) {
      map['email_verified_at'] = Variable<DateTime?>(emailVerifiedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime?>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime?>(updatedAt.value);
    }
    if (followsCount.present) {
      map['follows_count'] = Variable<int?>(followsCount.value);
    }
    if (followersCount.present) {
      map['followers_count'] = Variable<int?>(followersCount.value);
    }
    if (isFollowed.present) {
      map['is_followed'] = Variable<bool>(isFollowed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('description: $description, ')
          ..write('avatar: $avatar, ')
          ..write('email: $email, ')
          ..write('emailVerifiedAt: $emailVerifiedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('followsCount: $followsCount, ')
          ..write('followersCount: $followersCount, ')
          ..write('isFollowed: $isFollowed')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      typeName: 'TEXT',
      requiredDuringInsert: false);
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      typeName: 'TEXT',
      requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _emailVerifiedAtMeta =
      const VerificationMeta('emailVerifiedAt');
  late final GeneratedColumn<DateTime?> emailVerifiedAt =
      GeneratedColumn<DateTime?>('email_verified_at', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _followsCountMeta =
      const VerificationMeta('followsCount');
  late final GeneratedColumn<int?> followsCount = GeneratedColumn<int?>(
      'follows_count', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _followersCountMeta =
      const VerificationMeta('followersCount');
  late final GeneratedColumn<int?> followersCount = GeneratedColumn<int?>(
      'followers_count', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _isFollowedMeta = const VerificationMeta('isFollowed');
  late final GeneratedColumn<bool?> isFollowed = GeneratedColumn<bool?>(
      'is_followed', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_followed IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        username,
        description,
        avatar,
        email,
        emailVerifiedAt,
        createdAt,
        updatedAt,
        followsCount,
        followersCount,
        isFollowed
      ];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('email_verified_at')) {
      context.handle(
          _emailVerifiedAtMeta,
          emailVerifiedAt.isAcceptableOrUnknown(
              data['email_verified_at']!, _emailVerifiedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('follows_count')) {
      context.handle(
          _followsCountMeta,
          followsCount.isAcceptableOrUnknown(
              data['follows_count']!, _followsCountMeta));
    }
    if (data.containsKey('followers_count')) {
      context.handle(
          _followersCountMeta,
          followersCount.isAcceptableOrUnknown(
              data['followers_count']!, _followersCountMeta));
    }
    if (data.containsKey('is_followed')) {
      context.handle(
          _isFollowedMeta,
          isFollowed.isAcceptableOrUnknown(
              data['is_followed']!, _isFollowedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Tweet extends DataClass implements Insertable<Tweet> {
  final int id;
  Tweet({required this.id});
  factory Tweet.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Tweet(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  TweetsCompanion toCompanion(bool nullToAbsent) {
    return TweetsCompanion(
      id: Value(id),
    );
  }

  factory Tweet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Tweet(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  Tweet copyWith({int? id}) => Tweet(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('Tweet(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(id.hashCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Tweet && other.id == this.id);
}

class TweetsCompanion extends UpdateCompanion<Tweet> {
  final Value<int> id;
  const TweetsCompanion({
    this.id = const Value.absent(),
  });
  TweetsCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<Tweet> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  TweetsCompanion copyWith({Value<int>? id}) {
    return TweetsCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TweetsCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $TweetsTable extends Tweets with TableInfo<$TweetsTable, Tweet> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TweetsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? 'tweets';
  @override
  String get actualTableName => 'tweets';
  @override
  VerificationContext validateIntegrity(Insertable<Tweet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tweet map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Tweet.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TweetsTable createAlias(String alias) {
    return $TweetsTable(_db, alias);
  }
}

class Article extends DataClass implements Insertable<Article> {
  final int id;
  final int userId;
  final String body;
  final String? image;
  final String createdAt;
  final String updatedAt;
  final bool isLiked;
  final bool isDisliked;
  final int repliesCount;
  final int likesCount;
  final int dislikesCount;
  Article(
      {required this.id,
      required this.userId,
      required this.body,
      this.image,
      required this.createdAt,
      required this.updatedAt,
      required this.isLiked,
      required this.isDisliked,
      required this.repliesCount,
      required this.likesCount,
      required this.dislikesCount});
  factory Article.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Article(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      isLiked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_liked'])!,
      isDisliked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_disliked'])!,
      repliesCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}replies_count'])!,
      likesCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}likes_count'])!,
      dislikesCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dislikes_count'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['is_liked'] = Variable<bool>(isLiked);
    map['is_disliked'] = Variable<bool>(isDisliked);
    map['replies_count'] = Variable<int>(repliesCount);
    map['likes_count'] = Variable<int>(likesCount);
    map['dislikes_count'] = Variable<int>(dislikesCount);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
      userId: Value(userId),
      body: Value(body),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isLiked: Value(isLiked),
      isDisliked: Value(isDisliked),
      repliesCount: Value(repliesCount),
      likesCount: Value(likesCount),
      dislikesCount: Value(dislikesCount),
    );
  }

  factory Article.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Article(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      body: serializer.fromJson<String>(json['body']),
      image: serializer.fromJson<String?>(json['image']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      isLiked: serializer.fromJson<bool>(json['isLiked']),
      isDisliked: serializer.fromJson<bool>(json['isDisliked']),
      repliesCount: serializer.fromJson<int>(json['repliesCount']),
      likesCount: serializer.fromJson<int>(json['likesCount']),
      dislikesCount: serializer.fromJson<int>(json['dislikesCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'body': serializer.toJson<String>(body),
      'image': serializer.toJson<String?>(image),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'isLiked': serializer.toJson<bool>(isLiked),
      'isDisliked': serializer.toJson<bool>(isDisliked),
      'repliesCount': serializer.toJson<int>(repliesCount),
      'likesCount': serializer.toJson<int>(likesCount),
      'dislikesCount': serializer.toJson<int>(dislikesCount),
    };
  }

  Article copyWith(
          {int? id,
          int? userId,
          String? body,
          String? image,
          String? createdAt,
          String? updatedAt,
          bool? isLiked,
          bool? isDisliked,
          int? repliesCount,
          int? likesCount,
          int? dislikesCount}) =>
      Article(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        body: body ?? this.body,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isLiked: isLiked ?? this.isLiked,
        isDisliked: isDisliked ?? this.isDisliked,
        repliesCount: repliesCount ?? this.repliesCount,
        likesCount: likesCount ?? this.likesCount,
        dislikesCount: dislikesCount ?? this.dislikesCount,
      );
  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('body: $body, ')
          ..write('image: $image, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isLiked: $isLiked, ')
          ..write('isDisliked: $isDisliked, ')
          ..write('repliesCount: $repliesCount, ')
          ..write('likesCount: $likesCount, ')
          ..write('dislikesCount: $dislikesCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          userId.hashCode,
          $mrjc(
              body.hashCode,
              $mrjc(
                  image.hashCode,
                  $mrjc(
                      createdAt.hashCode,
                      $mrjc(
                          updatedAt.hashCode,
                          $mrjc(
                              isLiked.hashCode,
                              $mrjc(
                                  isDisliked.hashCode,
                                  $mrjc(
                                      repliesCount.hashCode,
                                      $mrjc(likesCount.hashCode,
                                          dislikesCount.hashCode)))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.body == this.body &&
          other.image == this.image &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isLiked == this.isLiked &&
          other.isDisliked == this.isDisliked &&
          other.repliesCount == this.repliesCount &&
          other.likesCount == this.likesCount &&
          other.dislikesCount == this.dislikesCount);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> body;
  final Value<String?> image;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<bool> isLiked;
  final Value<bool> isDisliked;
  final Value<int> repliesCount;
  final Value<int> likesCount;
  final Value<int> dislikesCount;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.body = const Value.absent(),
    this.image = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isLiked = const Value.absent(),
    this.isDisliked = const Value.absent(),
    this.repliesCount = const Value.absent(),
    this.likesCount = const Value.absent(),
    this.dislikesCount = const Value.absent(),
  });
  ArticlesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String body,
    this.image = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.isLiked = const Value.absent(),
    this.isDisliked = const Value.absent(),
    required int repliesCount,
    required int likesCount,
    required int dislikesCount,
  })  : userId = Value(userId),
        body = Value(body),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        repliesCount = Value(repliesCount),
        likesCount = Value(likesCount),
        dislikesCount = Value(dislikesCount);
  static Insertable<Article> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? body,
    Expression<String?>? image,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<bool>? isLiked,
    Expression<bool>? isDisliked,
    Expression<int>? repliesCount,
    Expression<int>? likesCount,
    Expression<int>? dislikesCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (body != null) 'body': body,
      if (image != null) 'image': image,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isLiked != null) 'is_liked': isLiked,
      if (isDisliked != null) 'is_disliked': isDisliked,
      if (repliesCount != null) 'replies_count': repliesCount,
      if (likesCount != null) 'likes_count': likesCount,
      if (dislikesCount != null) 'dislikes_count': dislikesCount,
    });
  }

  ArticlesCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? body,
      Value<String?>? image,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<bool>? isLiked,
      Value<bool>? isDisliked,
      Value<int>? repliesCount,
      Value<int>? likesCount,
      Value<int>? dislikesCount}) {
    return ArticlesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      body: body ?? this.body,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isLiked: isLiked ?? this.isLiked,
      isDisliked: isDisliked ?? this.isDisliked,
      repliesCount: repliesCount ?? this.repliesCount,
      likesCount: likesCount ?? this.likesCount,
      dislikesCount: dislikesCount ?? this.dislikesCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (isLiked.present) {
      map['is_liked'] = Variable<bool>(isLiked.value);
    }
    if (isDisliked.present) {
      map['is_disliked'] = Variable<bool>(isDisliked.value);
    }
    if (repliesCount.present) {
      map['replies_count'] = Variable<int>(repliesCount.value);
    }
    if (likesCount.present) {
      map['likes_count'] = Variable<int>(likesCount.value);
    }
    if (dislikesCount.present) {
      map['dislikes_count'] = Variable<int>(dislikesCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('body: $body, ')
          ..write('image: $image, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isLiked: $isLiked, ')
          ..write('isDisliked: $isDisliked, ')
          ..write('repliesCount: $repliesCount, ')
          ..write('likesCount: $likesCount, ')
          ..write('dislikesCount: $dislikesCount')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ArticlesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      typeName: 'TEXT',
      requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _isLikedMeta = const VerificationMeta('isLiked');
  late final GeneratedColumn<bool?> isLiked = GeneratedColumn<bool?>(
      'is_liked', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_liked IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _isDislikedMeta = const VerificationMeta('isDisliked');
  late final GeneratedColumn<bool?> isDisliked = GeneratedColumn<bool?>(
      'is_disliked', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_disliked IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _repliesCountMeta =
      const VerificationMeta('repliesCount');
  late final GeneratedColumn<int?> repliesCount = GeneratedColumn<int?>(
      'replies_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _likesCountMeta = const VerificationMeta('likesCount');
  late final GeneratedColumn<int?> likesCount = GeneratedColumn<int?>(
      'likes_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dislikesCountMeta =
      const VerificationMeta('dislikesCount');
  late final GeneratedColumn<int?> dislikesCount = GeneratedColumn<int?>(
      'dislikes_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        body,
        image,
        createdAt,
        updatedAt,
        isLiked,
        isDisliked,
        repliesCount,
        likesCount,
        dislikesCount
      ];
  @override
  String get aliasedName => _alias ?? 'articles';
  @override
  String get actualTableName => 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<Article> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_liked')) {
      context.handle(_isLikedMeta,
          isLiked.isAcceptableOrUnknown(data['is_liked']!, _isLikedMeta));
    }
    if (data.containsKey('is_disliked')) {
      context.handle(
          _isDislikedMeta,
          isDisliked.isAcceptableOrUnknown(
              data['is_disliked']!, _isDislikedMeta));
    }
    if (data.containsKey('replies_count')) {
      context.handle(
          _repliesCountMeta,
          repliesCount.isAcceptableOrUnknown(
              data['replies_count']!, _repliesCountMeta));
    } else if (isInserting) {
      context.missing(_repliesCountMeta);
    }
    if (data.containsKey('likes_count')) {
      context.handle(
          _likesCountMeta,
          likesCount.isAcceptableOrUnknown(
              data['likes_count']!, _likesCountMeta));
    } else if (isInserting) {
      context.missing(_likesCountMeta);
    }
    if (data.containsKey('dislikes_count')) {
      context.handle(
          _dislikesCountMeta,
          dislikesCount.isAcceptableOrUnknown(
              data['dislikes_count']!, _dislikesCountMeta));
    } else if (isInserting) {
      context.missing(_dislikesCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Article.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final $TweetsTable tweets = $TweetsTable(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final TagDao tagDao = TagDao(this as AppDatabase);
  late final TweetDao tweetDao = TweetDao(this as AppDatabase);
  late final ArticleDao articleDao = ArticleDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, tweets, articles];
}
