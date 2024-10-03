import 'package:get_it/get_it.dart';
import 'package:sway/util/app_logger.dart';

final injector = GetIt.instance;

Future<void> init() async {
  AppLogger.infolog("initializing injector");
}