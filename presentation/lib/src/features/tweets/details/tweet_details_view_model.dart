import 'package:core/core/core_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class TweetDetailsViewModel extends CoreViewModel {
  final GetTweetByIdUseCase _getTweetByIdUseCase;
  late String _errorMessage;
  String get errorMessage => _errorMessage;
  late TweetModel _article;
  TweetModel get article => _article;

  TweetDetailsViewModel(this._getTweetByIdUseCase);

  void getArticleDetails(int id) async {
    loading();

    final result = await _getTweetByIdUseCase.getTweet(id);
    result.when(success: (article) => _article = article, error: (type, message) => _errorMessage = message);

    loaded(result.isSuccessful);
  }
}
