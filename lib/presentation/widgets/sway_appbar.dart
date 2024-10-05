import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/gen/assets.gen.dart';

class SwayAppbar extends StatelessWidget {
  const SwayAppbar({
    super.key,
    this.callback,
    this.title,
  });
  final VoidCallback? callback;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => callback?.call(),
              icon: const Icon(Icons.arrow_back_rounded)),
          Text(
            title ?? "",
            style: AppTypography.sWaySemibold24,
          ),
          SvgPicture.asset(Assets.vector.home.bellIcon)
        ],
      ),
    );
  }
}
