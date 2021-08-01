import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/article_model.dart';
import 'package:domain/src/repository/article_repository.dart';
import 'package:domain/src/usecase/article_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllArticlesUseCase)
class GetAllArticlesUseCaseImpl extends GetAllArticlesUseCase {
  final ArticleRepository _repository;

  GetAllArticlesUseCaseImpl(this._repository);

  @override
  Future<Result<List<ArticleModel>>> getArticles() => _repository.getArticles();
}

@Injectable(as: GetArticleByIdUseCase)
class GetArticleByIdUseCaseImpl extends GetArticleByIdUseCase {
  final ArticleRepository _repository;

  GetArticleByIdUseCaseImpl(this._repository);

  @override
  Future<Result<ArticleModel>> getArticle(int id) => _repository.getArticle(id);
}
