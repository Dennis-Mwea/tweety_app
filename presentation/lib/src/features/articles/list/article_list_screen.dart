import 'dart:math';

import 'package:animations/animations.dart';
import 'package:core/service/toast_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/common/constants/decorations.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/articles/list/article_list_view_model.dart';
import 'package:presentation/src/features/articles/list/pages/tweets_screen.dart';
import 'package:presentation/src/features/articles/new_tweet/new_tweet_scree.dart';
import 'package:presentation/src/features/explore/explore_screen.dart';
import 'package:presentation/src/features/messages/messages_screen.dart';
import 'package:presentation/src/features/notifications/notifications_screen.dart';
import 'package:presentation/src/utils/bottom_nav.dart';
import 'package:presentation/src/widgets/nav_drawer.dart';
import 'package:stacked/stacked.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  late AnimationController _animationController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticleListViewModel>.reactive(
      viewModelBuilder: () => ArticleListViewModel(locator<GetAllTweetsUseCase>(), locator<ToastService>()),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: NavDrawer(),
          body: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              children: [
                TweetsScreen(scaffoldKey: _scaffoldKey, scaffoldMessengerKey: _scaffoldMessengerKey, viewModel: viewModel),
                ExploreScreen(scaffoldKey: _scaffoldKey),
                MessagesScreen(scaffoldKey: _scaffoldKey),
                NotificationsScreen(scaffoldKey: _scaffoldKey),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: viewModel.currentPage,
            onTap: (int index) => viewModel.onBottomNavItemClicked(index, _animationController, _pageController),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).bottomAppBarTheme.color,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            elevation: 1.0,
            iconSize: 27.0,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: viewModel.currentPage == 0
                    ? Icon(bottomNavItems[0].activeIcon, color: Theme.of(context).primaryColor)
                    : Icon(bottomNavItems[0].defaultIcon),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: viewModel.currentPage == 1
                    ? Icon(bottomNavItems[1].activeIcon, color: Theme.of(context).primaryColor)
                    : Icon(bottomNavItems[1].defaultIcon),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: viewModel.currentPage == 2
                    ? Icon(bottomNavItems[2].activeIcon, color: Theme.of(context).primaryColor)
                    : Icon(bottomNavItems[2].defaultIcon),
              ),
              BottomNavigationBarItem(
                label: '',
                // icon:
                //   NotificationButton(
                //     bubbleColor: Colors.red,
                icon: viewModel.currentPage == 3
                    ? Icon(bottomNavItems[3].activeIcon, color: Theme.of(context).primaryColor)
                    : Icon(bottomNavItems[3].defaultIcon),
                //   ),
              ),
            ],
          ),
          floatingActionButton: OpenContainer(
            closedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(65.0))),
            closedColor: Theme.of(context).primaryColor,
            closedElevation: 0.0,
            transitionDuration: Duration(milliseconds: 500),
            openBuilder: (context, action) => PublishTweetScreen(),
            transitionType: ContainerTransitionType.fade,
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return Container(
                width: 60.0,
                height: 60.0,
                decoration: Decorations.fabDecoration(context),
                child: RawMaterialButton(
                  shape: CircleBorder(),
                  onPressed: openContainer,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (_, child) => Transform.rotate(angle: _animationController.value * pi, child: child),
                    child: Icon(Icons.add, size: 35.0, color: Colors.white),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
