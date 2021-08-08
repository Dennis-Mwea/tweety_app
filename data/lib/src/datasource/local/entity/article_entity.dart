import 'package:moor_flutter/moor_flutter.dart';

class Articles extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get body => text().withLength(min: 1, max: 256)();
  TextColumn get image => text().withLength(min: 1, max: 256).nullable()();
  TextColumn get createdAt => text().withLength(min: 1, max: 256)();
  TextColumn get updatedAt => text().withLength(min: 1, max: 256)();
  BoolColumn get isLiked => boolean().withDefault(Constant(false))();
  BoolColumn get isDisliked => boolean().withDefault(Constant(false))();
  IntColumn get repliesCount => integer()();
  IntColumn get likesCount => integer()();
  IntColumn get dislikesCount => integer()();
}
