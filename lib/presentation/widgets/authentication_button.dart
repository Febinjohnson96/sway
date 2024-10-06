import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/gen/assets.gen.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: 341.w,
        height: 56.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary200, width: 1),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.vector.common.googleicon),
            SizedBox(
              width: 20.w,
            ),
            Text(
              "continue with google",
              style: AppTypography.sWayMedium16.copyWith(
                color: AppColors.primary900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
