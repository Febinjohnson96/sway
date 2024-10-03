import 'package:go_router/go_router.dart';
import 'package:sway/config/route_name.dart';
import 'package:sway/presentation/splash/splash_ui.dart';

class AppRoutes {
  AppRoutes._();

  static final GoRouter appRoutes = GoRouter(routes: [
    GoRoute(
      path: RouteName.splash,
      builder: (context, state) => const SplashUi(),
    )
  ]);
}
