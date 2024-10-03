import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341.w,
      height: 56.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary200,width: 1),
          borderRadius: BorderRadius.circular(10), color: AppColors.primary0),
      child: Row(
        children: [
          Text(
            "continue with google",
            style: AppTypography.sWayMedium16.copyWith(
              color: AppColors.primary900,
            ),
          )
        ],
      ),
    );
  }
}
