import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/presentation/widgets/authentication_button.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get Started",
            style: AppTypography.sWaySemibold32,
          ),
          Text(
            "with your sway account",
            style: AppTypography.sWayMedium16
                .copyWith(color: AppColors.primary500),
          ),
          SizedBox(height: 24.h),
          const Align(
              alignment: Alignment.center, child: AuthenticationButton())
        ],
      ),
    );
  }
}
