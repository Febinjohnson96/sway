import 'package:go_router/go_router.dart';
import 'package:sway/config/route_name.dart';
import 'package:sway/domain/model/product/product_model.dart';
import 'package:sway/presentation/auth/auth_ui.dart';
import 'package:sway/presentation/detail/detail_ui.dart';
import 'package:sway/presentation/main_view/main_view_ui.dart';
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
      path: RouteName.mainView,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
        path: RouteName.detailView,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return DetailUi(product: product);
        }),
  ]);
}
