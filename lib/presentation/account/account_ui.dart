import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sway/injector.dart';
import 'package:sway/presentation/account/bloc/account_bloc.dart';
import 'package:sway/presentation/account/ui/account_screen.dart';

class AccountUi extends StatelessWidget {
  const AccountUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountBloc>(
      create: (context) => AccountBloc(authentication: injector()),
      child: const AccountScreen(),
    );
  }
}
