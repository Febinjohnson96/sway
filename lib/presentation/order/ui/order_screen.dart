import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sway/presentation/order/bloc/order_bloc.dart';
import 'package:sway/presentation/order/widgets/order_card.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';
import 'package:sway/presentation/widgets/sway_appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: Column(
        children: [
          SwayAppbar(
            callback: () => context.pop(),
            title: "My Orders",
          ),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state is OrderFetchLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is OrderFetchSuccessState) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        product: state.products[index],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 12.h,
                    ),
                  ),
                );
              } else if (state is OrderFaliureState) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              } else {
                return const Center(
                  child: Text('Wow Such Empty!'),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
