import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/tweet_model.dart';

abstract class TweetRepository {
  Future<Result<List<TweetModel>>> getTweets();

  Future<Result<TweetModel>> getTweet(int id);
}
