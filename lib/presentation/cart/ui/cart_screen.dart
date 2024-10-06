import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/config/route_name.dart';
import 'package:sway/presentation/cart/bloc/cart_bloc.dart';
import 'package:sway/presentation/cart/widget/cart_card.dart';
import 'package:sway/presentation/widgets/app_button.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if(state is OrderSuccessState){
            context.push(RouteName.myOrders);
          }
        },
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
                              return CartCard(
                                img: state.products[index].image ?? '',
                                name: state.products[index].name ?? '',
                                price: state.products[index].price ?? '',
                                callback: () => context.read<CartBloc>().add(
                                    CartDeleteItemEvent(
                                        productId:
                                            state.products[index].id ?? '')),
                              );
                            },
                            itemCount: state.products.length,
                            shrinkWrap: true,
                            separatorBuilder:
                                (BuildContext context, int index) {
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
                  AppButton(
                      buttonTitle: "Checkout",
                      callback: () {
                        context.read<CartBloc>().add(OnTapPaymentEvent(
                            totalAmount: state.totalPrice.toString()));
                      }),
                ] else if (state is CartError || state is CartEmpty) ...[
                  const Center(
                    child: Text("Wow Such Empty"),
                  ),
                ] else ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
