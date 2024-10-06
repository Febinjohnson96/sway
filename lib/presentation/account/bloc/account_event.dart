part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountInitialEvent extends AccountEvent {}
class LogoutEvent extends AccountEvent {}
