import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/common/constants/assets.dart';
import 'package:presentation/src/common/constants/strings.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/articles/details/article_details_view_model.dart';

class ArticleDetailsScreen extends CoreScreen<ArticleDetailsViewModel> {
  final int id;

  ArticleDetailsScreen({required this.id});

  @override
  Widget builder(BuildContext context, ArticleDetailsViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.articleDetail)),
      body: _buildBody(context, viewModel),
    );
  }

  @override
  ArticleDetailsViewModel viewModelBuilder(BuildContext context) => locator<ArticleDetailsViewModel>()..getArticleDetails(id);

  Widget _buildBody(BuildContext context, ArticleDetailsViewModel viewModel) {
    if (viewModel.isBusy) {
      return Center(child: CircularProgressIndicator());
    } else if (viewModel.hasError) {
      return Center(child: Text(viewModel.errorMessage));
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInImage(
              image: NetworkImage(viewModel.article.image ?? ''),
              placeholder: AssetImage(Assets.placeholder),
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(viewModel.article.body, style: TextStyle(fontSize: 22, color: Theme.of(context).accentColor)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(viewModel.article.body, style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Align(child: Text("${Strings.publishedOn} ${viewModel.article.createdAt}"), alignment: Alignment.centerRight),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextButton(
                child: Text(
                  Strings.readFullStory,
                  style: TextStyle(fontSize: 16, color: Theme.of(context).accentColor),
                  textAlign: TextAlign.end,
                ),
                onPressed: () => {},
              ),
            ),
          ],
        ),
      );
    }
  }
}
