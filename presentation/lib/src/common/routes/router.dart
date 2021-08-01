import 'package:auto_route/annotations.dart';
import 'package:presentation/src/features/articles/details/article_details_screen.dart';
import 'package:presentation/src/features/articles/list/article_list_screen.dart';
import 'package:presentation/src/features/login/login_screen.dart';
import 'package:presentation/src/features/splash/splash_screen.dart';

export 'router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: LoginScreen),
  AutoRoute(page: ArticleListScreen),
  AutoRoute(page: ArticleDetailsScreen),
])
class $FeatureRouter {}
