import 'package:data/src/datasource/remote/dto/base/base_response.dart';
import 'package:data/src/datasource/remote/dto/base/pagination_response.dart';
import 'package:data/src/datasource/remote/dto/tweet_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'tweet_service.g.dart';

@RestApi()
abstract class TweetService {
  factory TweetService(Dio dio, {String baseUrl}) = _TweetService;

  @GET("/tweets")
  Future<BaseResponse<PaginationResponse<TweetResponse>>> getTweets();
}
