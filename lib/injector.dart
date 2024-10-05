import 'package:get_it/get_it.dart';
import 'package:sway/managers/auth/authentication.dart';
import 'package:sway/managers/payment/payment.dart';
import 'package:sway/util/app_logger.dart';

final injector = GetIt.instance;

Future<void> init() async {
  AppLogger.infolog("initializing injector");
  if (!injector.isRegistered<Authentication>()) {
    injector.registerLazySingleton<Authentication>(() => Authentication());
  }
  if(!injector.isRegistered<PaymentManager>()){
    injector.registerLazySingleton<PaymentManager>(() => PaymentManager());
  }
}
