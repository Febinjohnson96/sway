import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/presentation/cart/bloc/cart_bloc.dart';
import 'package:sway/presentation/widgets/app_button.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(
            children: [
              Text("My Cart",
                  style: AppTypography.sWaySemibold24
                      .copyWith(color: AppColors.primary900)),
              SizedBox(
                height: 12.h,
              ),
              if (state is CartLoaded) ...[
                state.products.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
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
                                  children: [
                                    Image.network(
                                        state.products[index].image ?? ""),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.products[index].name ?? "",
                                            style: AppTypography.sWaySemiBold14,
                                          ),
                                          Text(
                                            "₹${state.products[index].price}",
                                            style: AppTypography.sWaySemiBold14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ));
                          },
                          itemCount: state.products.length,
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 12.h,
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Expanded(
                          child: Text("No products in cart"),
                        ), // Centered for empty cart
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: AppTypography.sWayRegular16,
                    ),
                    Text(
                      "₹${state.totalPrice}",
                      style: AppTypography.sWaySemiBold16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                AppButton(buttonTitle: "Checkout", callback: () {}),
              ] else if (state is CartError || state is CartEmpty) ...[
                const Center(
                  child: Text("Error loading products"),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
