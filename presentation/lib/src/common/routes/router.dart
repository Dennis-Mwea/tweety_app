import 'package:auto_route/annotations.dart';
import 'package:presentation/src/features/login/login_screen.dart';
import 'package:presentation/src/features/profile/view/profile_view_scree.dart';
import 'package:presentation/src/features/splash/splash_screen.dart';
import 'package:presentation/src/features/tweets/details/tweet_details_screen.dart';
import 'package:presentation/src/features/tweets/list/article_list_screen.dart';

export 'router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: LoginScreen),
  AutoRoute(page: ArticleListScreen),
  AutoRoute(page: TweetDetailsScreen),
  AutoRoute(page: ProfileViewScreen),
])
class $FeatureRouter {}
