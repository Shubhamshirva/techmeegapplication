import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:techmeegapplication/resources/routes/route_name.dart';
import 'package:techmeegapplication/view/Login.dart';
import 'package:techmeegapplication/view/Mainpages/homepage.dart';
import 'package:techmeegapplication/view/splash.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const Splash(),
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => const LoginPage(),
        ),
        GetPage(
          name: RouteName.homepage,
          page: () => const Homepage(),
        ),
  ];
}