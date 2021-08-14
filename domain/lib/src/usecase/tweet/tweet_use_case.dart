import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/tweet_model.dart';
import 'package:domain/src/usecase/base/base_use_case.dart';

/// abstraction of use case to be used by viewmodel
abstract class GetAllTweetsUseCase implements BaseUseCase {
  Future<Result<List<TweetModel>>> getTweets();
}

/// abstraction of use case to be used by view model
abstract class GetTweetByIdUseCase implements BaseUseCase {
  Future<Result<TweetModel>> getTweet(int id);
}
