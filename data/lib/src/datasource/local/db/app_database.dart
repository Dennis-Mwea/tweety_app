import 'dart:io';

import 'package:data/src/datasource/local/dao/tweet_dao.dart';
import 'package:data/src/datasource/local/dao/user_dao.dart';
import 'package:data/src/datasource/local/entity/tweet_entity.dart';
import 'package:data/src/datasource/local/entity/user_entity.dart';
import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    if (!await dbFolder.exists()) {
      await dbFolder.create(recursive: true);
    }

    final dbFile = File(p.join(dbFolder.path, 'db.sqlite'));

    return VmDatabase(dbFile);
  });
}

@UseMoor(tables: [Users, Tweets], daos: [TweetDao, UserDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
