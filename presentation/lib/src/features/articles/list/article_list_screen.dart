import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/common/constants/strings.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/articles/list/article_list_view_model.dart';

class ArticleListScreen extends CoreScreen<ArticleListViewModel> {
  @override
  Widget builder(BuildContext context, ArticleListViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.articleList)),
      body: _buildBody(context, viewModel),
      floatingActionButton: Visibility(
        visible: !viewModel.isBusy,
        child: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => viewModel.loadArticles(),
        ),
      ),
    );
  }

  @override
  ArticleListViewModel viewModelBuilder(BuildContext context) => locator<ArticleListViewModel>();

  Widget _buildBody(BuildContext context, ArticleListViewModel viewModel) {
    if (viewModel.isBusy) {
      return Center(child: CircularProgressIndicator());
    } else if (viewModel.hasError) {
      return Center(child: Text(viewModel.errorMessage));
    } else {
      return ListView.builder(
        itemCount: viewModel.articles.length,
        itemBuilder: (context, index) => ListTile(
          isThreeLine: true,
          subtitle: Text(viewModel.articles[index].date, textDirection: TextDirection.rtl),
          contentPadding: EdgeInsets.all(10),
          title: Text(viewModel.articles[index].title, style: TextStyle(fontSize: 18)),
          leading: CircleAvatar(backgroundImage: NetworkImage(viewModel.articles[index].imageUrl), radius: 40),
          onTap: () => viewModel.onArticleItemClicked(viewModel.articles[index].id),
        ),
      );
    }
  }
}
