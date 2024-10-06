import 'package:flutter/material.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/gen/assets.gen.dart';
import 'package:sway/presentation/account/widgets/account_button.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: Column(
        children: [
          AccountButton(
            title: "My Orders",
            color: AppColors.primary900,
            img: Assets.vector.account.orderBoxIcon,
          ),
          AccountButton(
            title: "Logout",
            color: AppColors.red,
            img: Assets.vector.account.logoutIcon,
          )
        ],
      ),
    );
  }
}
