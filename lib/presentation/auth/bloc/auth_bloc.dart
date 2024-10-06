import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sway/managers/auth/authentication.dart';
import 'package:sway/util/app_logger.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Authentication authentication;
  AuthBloc({required this.authentication}) : super(AuthInitial()) {
    on<AuthInitialEvent>((event, emit) {});
    on<AuthLoginEvent>(_authLoginEvent);
  }
  void _authLoginEvent(AuthLoginEvent event, Emitter<AuthState> emit) async {
    AppLogger.infolog("AuthLoginEvent");
    final userAuth = await authentication.googleSignin();

    if (userAuth.user != null) {
      emit(AuthSuccess());
    }else{
      emit(AuthError());
    }
  }
}
