import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {super.key,
      required this.assetName,
      this.callback,
      required this.buttonTitle});
  final String assetName;
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
            SvgPicture.asset(assetName),
            SizedBox(
              width: 20.w,
            ),
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
