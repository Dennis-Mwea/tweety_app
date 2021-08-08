import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/local/entity/tags_entity.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'tag_dao.g.dart';

@UseDao(tables: [Tags])
class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
  final AppDatabase appDb;

  TagDao(this.appDb) : super(appDb);

  Future insertTag(Insertable<Tag> tag) => into(tags).insert(tag);
}
