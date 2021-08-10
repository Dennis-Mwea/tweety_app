import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/local/entity/user_entity.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'user_dao.g.dart';

@UseDao(tables: [Users])
class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
  final AppDatabase appDb;

  TagDao(this.appDb) : super(appDb);

  Future insertTag(Insertable<User> tag) => into(users).insert(tag);
}
