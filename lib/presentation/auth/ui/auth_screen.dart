import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/presentation/widgets/authentication_button.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';
import 'package:sway/util/app_logger.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height: 20.h),
          Align(
              alignment: Alignment.center,
              child: AuthenticationButton(
                onTap: () => AppLogger.infolog("continue with google"),
              )),
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: Text(
              "By signing up you agree to our Terms and Privacy Policy",
              style: AppTypography.sWayMedium12
                  .copyWith(color: AppColors.primary900),
            ),
          )
        ],
      ),
    );
  }
}
