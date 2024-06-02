import 'package:flutter/material.dart';
import 'package:troover_admin/pages/_pages.dart';
import 'package:troover_admin/utils/_utils.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    print('Current route: `${routeSettings.name}`');

    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          // Base page
          case Constants.baseRoute:
            return const LoginPage();

          case LoginPage.routeName:
            return const LoginPage();
          case HomePage.routeName:
            return const HomePage();

          // Error case
          default:
            return const ErrorNotFoundPage();
        }
      },
    );
  }
}
