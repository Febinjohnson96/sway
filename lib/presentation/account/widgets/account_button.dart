import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sway/config/app_typography.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    super.key,
    this.onTap,
    required this.title,
    required this.color,
    required this.img,
  });
  final VoidCallback? onTap;
  final String title;
  final Color color;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap?.call(),
      child: SizedBox(
        height: 80.h,
        child: Row(
          children: [
            SvgPicture.asset(img),
            SizedBox(
              width: 20.w,
            ),
            Text(
              title,
              style: AppTypography.sWayRegular16.copyWith(color: color),
            )
          ],
        ),
      ),
    );
  }
}
