import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sway/injector.dart';
import 'package:sway/presentation/cart/bloc/cart_bloc.dart';
import 'package:sway/presentation/cart/ui/cart_screen.dart';

class CartUi extends StatelessWidget {
  const CartUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) =>
          CartBloc(paymentManager: injector())..add(CartInitialEvent()),
      child: const CartScreen(),
    );
  }
}
