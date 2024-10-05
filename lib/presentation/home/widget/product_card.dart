import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/domain/model/product/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 280.h,
      width: 161.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary100, width: 1),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primary0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              product.image ?? '',
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            product.name ?? '',
            style: AppTypography.sWaySemiBold16.copyWith(
              color: AppColors.primary900,
            ),
          ),
          Row(
            children: [
              Text(
                "₹${product.price}",
                style: AppTypography.sWayMedium12.copyWith(
                  color: AppColors.primary900,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              if (product.discount != null)
                Text(
                  "${product.discount}% off",
                  style:
                      AppTypography.sWayMedium12.copyWith(color: AppColors.red),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
