import 'package:data/src/datasource/local/dao/tweet_dao.dart';
import 'package:data/src/datasource/local/dao/user_dao.dart';
import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/remote/dto/base/base_response.dart' as ApiResponse;
import 'package:data/src/datasource/remote/dto/base/pagination_response.dart';
import 'package:data/src/datasource/remote/dto/tweet_response.dart';
import 'package:data/src/datasource/remote/service/tweet_service.dart';
import 'package:data/src/mapper/tweet_mapper.dart';
import 'package:data/src/mapper/user_mapper.dart';
import 'package:data/src/repository/base/base_repository.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TweetRepository)
class TweetRepositoryImpl extends BaseResponse implements TweetRepository {
  final TweetService _articleService;
  final TweetDao _tweetDao;
  final UserDao _userDao;

  TweetRepositoryImpl(this._articleService, this._tweetDao, this._userDao);

  @override
  Future<Result<TweetModel>> getTweet(int id) async {
    return safeDbCall(_tweetDao.getTweetById(id), mapper: (Tweet? entity) => entity!.toModel());
  }

  @override
  Future<Result<List<TweetModel>>> getTweets() {
    return safeApiCall(_articleService.getTweets(),
        mapper: (ApiResponse.BaseResponse<PaginationResponse<TweetResponse>> response) =>
            response.data.data.map<TweetModel>((e) => e.toModel()).toList(),
        saveResult: (ApiResponse.BaseResponse<PaginationResponse<TweetResponse>> response) async {
          // Save users first
          await _userDao.insertTweetUsers(response.data.data.map<User>((e) => e.user.toEntity()).toList());

          // Then save the tweets
          _tweetDao.insertTweets(response.data.data.map<Tweet>((e) => e.toEntity()).toList());
        });
  }
}
