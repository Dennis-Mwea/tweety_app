import 'package:data/src/datasource/remote/dto/article_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'article_service.g.dart';

@RestApi()
abstract class ArticleService {
  factory ArticleService(Dio dio, {String baseUrl}) = _ArticleService;

  @GET("/tweets")
  Future<ArticleResponse> getArticles();
}
