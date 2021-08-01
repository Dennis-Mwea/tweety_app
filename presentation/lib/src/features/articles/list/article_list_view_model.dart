import 'package:core/core/core_view_model.dart';
import 'package:core/service/toast_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/src/common/routes/router.dart';

@injectable
class ArticleListViewModel extends CoreViewModel {
  final GetAllArticlesUseCase _allArticlesUseCase;
  final ToastService _toastService;
  late List<ArticleModel> _articles;
  List<ArticleModel> get articles => _articles;
  late String _errorMessage;
  String get errorMessage => _errorMessage;

  ArticleListViewModel(this._allArticlesUseCase, this._toastService) {
    loadArticles();
  }

  void loadArticles() async {
    loading();

    final results = await _allArticlesUseCase.getArticles();
    results.when(success: (data) => _articles = data, error: (errorType, message) => _errorMessage = message);

    loaded(results.isSuccessful);
    if (results.isSuccessful) {
      _toastService.show('Data fetched.');
    }
  }

  void onArticleItemClicked(int id) {
    navigationService.push(ArticleDetailsScreenRoute(id: id));
  }
}
