import 'package:go_router/go_router.dart';
import 'package:sway/config/route_name.dart';

class AppRoutes {
  AppRoutes._();

  static final GoRouter appRoutes =
      GoRouter(routes: [GoRoute(path: RouteName.splash)]);
}
