import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/local/entity/tweet_entity.dart';
import 'package:moor/moor.dart';

part 'tweet_dao.g.dart';

@UseDao(tables: [Tweets])
class TweetDao extends DatabaseAccessor<AppDatabase> with _$TweetDaoMixin {
  final AppDatabase appDatabase;

  TweetDao(this.appDatabase) : super(appDatabase);

  Future insertTweet(Insertable<Tweet> article) => into(tweets).insert(article);

  Future insertTweets(List<Insertable<Tweet>> items) {
    return transaction(() async {
      for (Insertable<Tweet> item in items) await into(tweets).insert(item);
    });
  }

  // Future<List<Article>> getAllUsers() => select(tweets).get();

  Future<Tweet> getTweetById(int id) => select(tweets).getSingle();
}
