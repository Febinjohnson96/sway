import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/domain/model/product/product_model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key, required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 107.h,
        width: 342.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primary200,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.network(product.image ?? ''),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name ?? '',
                style: AppTypography.sWaySemiBold14,
                ),
                SizedBox(width: 10.w,),
                Text(
                  "₹${product.price}",
                  style: AppTypography.sWaySemiBold14,
                ),
              ],
            ),
          ],
        ));
  }
}
