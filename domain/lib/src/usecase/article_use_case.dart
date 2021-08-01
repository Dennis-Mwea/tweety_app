import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/article_model.dart';
import 'package:domain/src/usecase/base/base_use_case.dart';

/// abstraction of use case to be used by viewmodel
abstract class GetAllArticlesUseCase implements BaseUseCase {
  Future<Result<List<ArticleModel>>> getArticles();
}

/// abstraction of use case to be used by view model
abstract class GetArticleByIdUseCase implements BaseUseCase {
  Future<Result<ArticleModel>> getArticle(int id);
}
