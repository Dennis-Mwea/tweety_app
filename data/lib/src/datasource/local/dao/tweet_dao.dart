import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/local/entity/tweet_entity.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'tweet_dao.g.dart';

@UseDao(tables: [Tweets])
class TweetDao extends DatabaseAccessor<AppDatabase> with _$TweetDaoMixin {
  final AppDatabase appDatabase;

  TweetDao(this.appDatabase) : super(appDatabase);
}
