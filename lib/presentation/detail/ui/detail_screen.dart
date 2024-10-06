import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/domain/model/product/product_model.dart';
import 'package:sway/gen/assets.gen.dart';
import 'package:sway/presentation/detail/bloc/detail_bloc.dart';
import 'package:sway/presentation/widgets/app_icon_button.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';
import 'package:sway/presentation/widgets/sway_appbar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwayAppbar(
            callback: () => context.pop(),
            title: "Details",
          ),
          SizedBox(
            height: 369.h,
            width: 341.w,
            child: ClipRRect(
              child: Image.network(
                product.image ?? "",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            product.name ?? "",
            style: AppTypography.sWaySemibold24,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
              "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
              style: AppTypography.sWayMedium16
                  .copyWith(color: AppColors.primary500)),
          const Spacer(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: AppTypography.sWayMedium16
                          .copyWith(color: AppColors.primary500),
                    ),
                    Text(
                      "₹${product.price}",
                      style: AppTypography.sWaySemibold24
                          .copyWith(color: AppColors.primary900),
                    ),
                  ],
                ),
              ),
               Expanded(flex: 2, child: AppIconButton(
                callback: ()=> context.read<DetailBloc>().add(AddToCartEvent(product: product)),
                assetName: Assets.vector.detail.bagIcon,
                buttonTitle: 'Add to Cart',
              )),
            ],
          )
        ],
      ),
    );
  }
}
