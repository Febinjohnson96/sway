import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/gen/assets.gen.dart';
import 'package:sway/presentation/widgets/sw_scaffold_without_padding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithoutPadding(
        child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ColoredBox(
        color: AppColors.primary900,
        child: Stack(
          children: [
            SvgPicture.asset(Assets.vector.splash.splashBg,
            fit: BoxFit.cover,
            width: 400.w,
            ),
            Center(
              child: SvgPicture.asset(Assets.vector.logo),
            ),
          ],
        ),
      ),
    ));
  }
}
