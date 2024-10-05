import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sway/managers/auth/authentication.dart';
import 'package:sway/util/app_logger.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final Authentication authentication;
  SplashBloc({required this.authentication}) : super(SplashInitial()) {
    on<SplashInitialEvent>(_splashInitialEvent);
  }
  void _splashInitialEvent(
      SplashInitialEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    final user = await authentication.userAuthenticationStatus();
    if (user != null) {
      AppLogger.infolog(user.email.toString());
      emit(AuthenticatedAccount());
    } else {
      emit(UnAuthenticatedAccount());
    }
  }
}
