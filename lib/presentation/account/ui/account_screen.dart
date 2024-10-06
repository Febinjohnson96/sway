import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/route_name.dart';
import 'package:sway/gen/assets.gen.dart';
import 'package:sway/presentation/account/bloc/account_bloc.dart';
import 'package:sway/presentation/account/widgets/account_button.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: BlocListener<AccountBloc, AccountState>(
        listener: (context, state) {
         if(state is AccountLogoutSuccess){
           context.go(RouteName.auth);
         }
        },
        child: Column(
          children: [
            AccountButton(
              onTap: () => context.push(RouteName.myOrders),
              title: "My Orders",
              color: AppColors.primary900,
              img: Assets.vector.account.orderBoxIcon,
            ),
            AccountButton(
              onTap: () => context.read<AccountBloc>()..add(LogoutEvent()),
              title: "Logout",
              color: AppColors.red,
              img: Assets.vector.account.logoutIcon,
            )
          ],
        ),
      ),
    );
  }
}
