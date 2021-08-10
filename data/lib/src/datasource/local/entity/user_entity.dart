import 'package:moor_flutter/moor_flutter.dart';

class Users extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 20)();
  TextColumn get username => text().withLength(min: 1, max: 20)();
  TextColumn get description => text().withLength(min: 1, max: 256).nullable()();
  TextColumn get avatar => text().withLength(min: 1, max: 256).nullable()();
  TextColumn get email => text().withLength(min: 1, max: 256)();
  DateTimeColumn get emailVerifiedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  IntColumn get followsCount => integer().nullable()();
  IntColumn get followersCount => integer().nullable()();
  BoolColumn get isFollowed => boolean().withDefault(Constant(false))();
}
