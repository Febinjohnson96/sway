import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sway/managers/auth/authentication.dart';
import 'package:sway/util/app_logger.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final Authentication authentication;
  AccountBloc({required this.authentication}) : super(AccountInitial()) {
    on<LogoutEvent>(_logOutEvent);
  }

  void _logOutEvent(LogoutEvent event, Emitter<AccountState> emit) async{
    AppLogger.debuglog("Logout");
    try{
      await authentication.signOut();
      emit(AccountLogoutSuccess());
      
    } catch(e){
      AppLogger.errorlog(e.toString());
      emit(AccountLogoutError());
    }
  }
}
