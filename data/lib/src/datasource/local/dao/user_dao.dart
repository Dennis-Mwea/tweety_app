import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/local/entity/user_entity.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'user_dao.g.dart';

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  final AppDatabase appDb;

  UserDao(this.appDb) : super(appDb);

  Future<void> insertTweetUsers(List<Insertable<User>> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(users, items);
    });
  }

  Future insertTag(Insertable<User> tag) => into(users).insert(tag);
}
