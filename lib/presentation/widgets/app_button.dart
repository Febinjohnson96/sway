import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.callback,
      required this.buttonTitle});
  final VoidCallback? callback;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback?.call(),
      child: Container(
        width: 341.w,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary900,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonTitle,
              style: AppTypography.sWayMedium16
                  .copyWith(color: AppColors.primary0),
            ),
          ],
        ),
      ),
    );
  }
}
