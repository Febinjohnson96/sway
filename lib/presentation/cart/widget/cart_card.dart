import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/gen/assets.gen.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    this.callback,
  });
  final String img;
  final String name;
  final String price;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.primary200,
              width: 1,
            )),
        height: 107.h,
        width: 342.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(img),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTypography.sWaySemiBold14,
                  ),
                  Text(
                    "₹$price",
                    style: AppTypography.sWaySemiBold14,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () => callback?.call(),
                      icon: SvgPicture.asset(Assets.vector.cart.deleteIcon))),
            )
          ],
        ));
  }
}
