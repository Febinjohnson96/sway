import 'package:go_router/go_router.dart';
import 'package:sway/config/route_name.dart';
import 'package:sway/presentation/auth/auth_ui.dart';
import 'package:sway/presentation/home/home_ui.dart';
import 'package:sway/presentation/splash/splash_ui.dart';

class AppRoutes {
  AppRoutes._();

  static final GoRouter appRoutes = GoRouter(routes: [
    GoRoute(
      path: RouteName.splash,
      builder: (context, state) => const SplashUi(),
    ),
    GoRoute(
      path: RouteName.auth,
      builder: (context, state) => const AuthUi(),
    ),
    GoRoute(
      path: RouteName.home,
      builder: (context, state) => const HomeUi(),
    )
  ]);
}
