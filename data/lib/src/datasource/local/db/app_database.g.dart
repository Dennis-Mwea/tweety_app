// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Tag extends DataClass implements Insertable<Tag> {
  final String name;
  final int color;
  Tag({required this.name, required this.color});
  factory Tag.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Tag(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      color: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['color'] = Variable<int>(color);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      name: Value(name),
      color: Value(color),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Tag(
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
    };
  }

  Tag copyWith({String? name, int? color}) => Tag(
        name: name ?? this.name,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode, color.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag && other.name == this.name && other.color == this.color);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> name;
  final Value<int> color;
  const TagsCompanion({
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  TagsCompanion.insert({
    required String name,
    required int color,
  })  : name = Value(name),
        color = Value(color);
  static Insertable<Tag> custom({
    Expression<String>? name,
    Expression<int>? color,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  TagsCompanion copyWith({Value<String>? name, Value<int>? color}) {
    return TagsCompanion(
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TagsTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _colorMeta = const VerificationMeta('color');
  late final GeneratedColumn<int?> color = GeneratedColumn<int?>(
      'color', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, color];
  @override
  String get aliasedName => _alias ?? 'tags';
  @override
  String get actualTableName => 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Tag.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(_db, alias);
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
  late final $TagsTable tags = $TagsTable(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final TagDao tagDao = TagDao(this as AppDatabase);
  late final ArticleDao articleDao = ArticleDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tags, articles];
}
