import 'package:core/core/core_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArticleDetailsViewModel extends CoreViewModel {
  final GetArticleByIdUseCase _articleByIdUseCase;
  late String _errorMessage;
  String get errorMessage => _errorMessage;
  late ArticleModel _article;
  ArticleModel get article => _article;

  ArticleDetailsViewModel(this._articleByIdUseCase);

  void getArticleDetails(int id) async {
    loading();

    final result = await _articleByIdUseCase.getArticle(id);
    result.when(success: (article) => _article = article, error: (type, message) => _errorMessage = message);

    loaded(result.isSuccessful);
  }
}
