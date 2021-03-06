import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/presentation/screen/home/home_screen.dart';
import 'package:flutter_template/presentation/screen/splash/splash_screen.dart';
import 'package:flutter_template/presentation/screen/tab/app_bottom_navigation_bar.dart';

export 'app_route.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashScreen,
      initial: true,
      children: <AutoRoute>[],
    ),
    AutoRoute(
      path: '/bottom_tab',
      page: AppBottomNavigationBar,
      name: 'AppBottomNavigationBarRoute',
      children: <AutoRoute>[
        AutoRoute(
          path: 'home',
          page: HomeScreen,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
