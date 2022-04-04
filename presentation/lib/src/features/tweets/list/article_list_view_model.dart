import 'package:core/core/core_view_model.dart';
import 'package:core/service/toast_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/src/common/routes/router.dart';

@injectable
class ArticleListViewModel extends CoreViewModel {
  final GetAllTweetsUseCase _allArticlesUseCase;
  final ToastService _toastService;
  late List<TweetModel> _articles;

  List<TweetModel> get articles => _articles;
  late String _errorMessage;

  String get errorMessage => _errorMessage;
  late int _currentPage;

  int get currentPage => _currentPage;

  ArticleListViewModel(this._allArticlesUseCase, this._toastService);

  void initialise() {
    _currentPage = 0;
    loadArticles();
  }

  void loadArticles() async {
    loading();

    final results = await _allArticlesUseCase.getTweets();
    results.when(success: (data) => _articles = data, error: (errorType, message) => throw Exception(errorType));

    loaded(results.isSuccessful);
    if (results.isSuccessful) {
      _toastService.show('Data fetched.');
    }
  }

  void onArticleItemClicked(int id) {
    navigationService.push(TweetDetailsScreenRoute(id: id));
  }

  void onBottomNavItemClicked(int index, AnimationController animationController, PageController pageController) {
    animationController.forward(from: 0);

    _currentPage = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  void onUserClicked(String username) {
    navigationService.push(ProfileViewScreenRoute(username: 'Dennis'));
  }
}
