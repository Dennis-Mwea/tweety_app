import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/local/entity/tweet_entity.dart';
import 'package:data/src/datasource/local/entity/user_entity.dart';
import 'package:moor/moor.dart';

part 'tweet_dao.g.dart';

@UseDao(tables: [Tweets, Users])
class TweetDao extends DatabaseAccessor<AppDatabase> with _$TweetDaoMixin {
  final AppDatabase appDatabase;

  TweetDao(this.appDatabase) : super(appDatabase);

  Future insertTweet(Insertable<Tweet> article) => into(tweets).insert(article);

  Future<void> insertTweets(List<Insertable<Tweet>> items) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(tweets, items);
    });
  }

  // Future<List<Article>> getAllUsers() => select(tweets).get();

  Future<Tweet> getTweetById(int id) => select(tweets).getSingle();
}
