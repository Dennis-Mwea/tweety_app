import 'package:flutter/material.dart';
import 'package:presentation/src/features/articles/list/article_list_view_model.dart';
import 'package:presentation/src/widgets/buttons/avatar_button.dart';
import 'package:presentation/src/widgets/cards/tweet_card.dart';
import 'package:presentation/src/widgets/loading_indicator.dart';

class TweetsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ArticleListViewModel viewModel;

  const TweetsScreen({Key? key, required this.scaffoldMessengerKey, required this.scaffoldKey, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        strokeWidth: 1.0,
        onRefresh: () {
          // context.read<TweetBloc>().add(
          //   RefreshTweet(),
          // );
          // return _tweetRefreshCompleter.future;
          return Future.value();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 20.0,
              floating: true,
              iconTheme: IconThemeData(color: Theme.of(context).textSelectionTheme.cursorColor),
              leading: AvatarButton(scaffoldKey: scaffoldKey),
              title: Image.network('https://source.unsplash.com/daily?code'),
              centerTitle: true,
              brightness: Brightness.light,
            ),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (viewModel.isBusy) {
      return SliverFillRemaining(child: LoadingIndicator());
    } else if (viewModel.hasError) {
      return SliverFillRemaining(child: Center(child: Text(viewModel.errorMessage)));
    } else {
      if (viewModel.articles.isNotEmpty)
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: GestureDetector(
                child: TweetCard(tweet: viewModel.articles[index], scaffoldMessengerKey: scaffoldMessengerKey),
              ),
            ),
            childCount: viewModel.articles.length,
          ),
        );
      else
        return SliverFillRemaining(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No tweets yet!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text("When you follows someone, you'll see their tweets here.",
                  textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        );
    }
  }
}
