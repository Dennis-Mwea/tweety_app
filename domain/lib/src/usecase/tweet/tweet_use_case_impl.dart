import 'package:domain/domain.dart';
import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/tweet_model.dart';
import 'package:domain/src/usecase/tweet/tweet_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllTweetsUseCase)
class GetAllTweetsUseCaseImpl extends GetAllTweetsUseCase {
  final TweetRepository _repository;

  GetAllTweetsUseCaseImpl(this._repository);

  @override
  Future<Result<List<TweetModel>>> getTweets() => _repository.getTweets();
}

@Injectable(as: GetTweetByIdUseCase)
class GetTweetByIdUseCaseImpl extends GetTweetByIdUseCase {
  final TweetRepository _repository;

  GetTweetByIdUseCaseImpl(this._repository);

  @override
  Future<Result<TweetModel>> getTweet(int id) => _repository.getTweet(id);
}
