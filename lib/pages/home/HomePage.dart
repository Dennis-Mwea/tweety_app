import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweety_app/blocs/auth/Bloc.dart';
import 'package:tweety_app/pages/PublishTweetPage.dart';
import 'package:tweety_app/pages/messages/MessagePage.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  // List<Tweet> tweets = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // context.read<AuthProfileBloc>().add(GetAvatar());
    _scrollController.addListener(_onScroll);
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      // context.read<TweetBloc>().add(
      //   FetchTweet(),
      // );
    }
  }

  void changePage(int index) {
    _animationController.forward(from: 0);
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
    if (index == 2) {
      // context.read<NotificationBloc>().add(ResetNotificationCounts());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [BlocListener<AuthBloc, AuthState>(listener: (context, state) {})],
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int page) {
              setState(() => _currentIndex = page);
            },
            children: [TweetsScreen(), ExploreScreen(), MessagePage(), NotificationScreen()],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: changePage,
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
            icon: _currentIndex == 0
                ? Icon(bottomNavItems[0].activeIcon, color: Theme.of(context).primaryColor)
                : Icon(bottomNavItems[0].defaultIcon),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: _currentIndex == 1
                ? Icon(bottomNavItems[1].activeIcon, color: Theme.of(context).primaryColor)
                : Icon(bottomNavItems[1].defaultIcon),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: _currentIndex == 2
                ? Icon(bottomNavItems[2].activeIcon, color: Theme.of(context).primaryColor)
                : Icon(bottomNavItems[2].defaultIcon),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: NotificationButton(
                bubbleColor: Colors.red,
                icon: _currentIndex == 3
                    ? Icon(bottomNavItems[3].activeIcon, color: Theme.of(context).primaryColor)
                    : Icon(bottomNavItems[3].defaultIcon)),
          ),
        ],
      ),
      floatingActionButton: OpenContainer(
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(65.0),
          ),
        ),
        closedColor: Theme.of(context).primaryColor,
        closedElevation: 0.0,
        transitionDuration: Duration(milliseconds: 500),
        openBuilder: (context, action) => PublishTweetPage(),
        transitionType: ContainerTransitionType.fade,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [Color(0xFF2F80ED), Color(0xFF56CCF2)],
              // ),
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Color(0xFF2F80ED).withOpacity(.3), offset: Offset(0.0, 8.0), blurRadius: 8.0)],
            ),
            child: RawMaterialButton(
              shape: CircleBorder(),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (_, child) {
                  return Transform.rotate(angle: _animationController.value * pi, child: child);
                },
                child: Icon(Icons.add, size: 35.0, color: Colors.white),
              ),
              onPressed: openContainer,
            ),
          );
        },
      ),
    );
  }
}

class TweetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Tweet Screen'));
  }
}

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Explore Screen'));
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Notification Screen'));
  }
}

class BottomNav {
  final String name;
  final IconData defaultIcon;
  final IconData activeIcon;

  BottomNav({required this.name, required this.defaultIcon, required this.activeIcon});
}

List<BottomNav> bottomNavItems = [
  BottomNav(name: 'Tweets', defaultIcon: Icons.home, activeIcon: Icons.home),
  BottomNav(name: 'Explore', defaultIcon: Icons.search, activeIcon: Icons.search),
  BottomNav(name: 'Messages', defaultIcon: Icons.messenger_outline_rounded, activeIcon: Icons.messenger_rounded),
  BottomNav(name: 'Notificaitons', defaultIcon: Icons.notifications_none, activeIcon: Icons.notifications),
];

class NotificationButton extends StatefulWidget {
  final Color bubbleColor;
  final Icon icon;

  NotificationButton({Key? key, required this.bubbleColor, required this.icon}) : super(key: key);

  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  void initState() {
    // context.read<NotificationBloc>().add(FetchNotificationCounts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.icon,
        // BlocBuilder<NotificationBloc, NotificationState>(
        //         //   builder: (context, state) {
        //         //     if (state is NotificationCountsLoaded &&
        //         //         state.notificationCounts > 0) {
        //       return
        Positioned(
          left: 11.0,
          top: 0.0,
          child: Container(
            height: 15.0,
            width: 15.0,
            decoration: BoxDecoration(
              color: widget.bubbleColor != null ? widget.bubbleColor : Colors.white.withOpacity(.4),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                '0',
                style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
        // }
        //     return Container(height: 0, width: 0);
        //   },
        // )
      ],
    );
  }
}
