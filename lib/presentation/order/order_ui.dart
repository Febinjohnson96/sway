import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sway/presentation/order/bloc/order_bloc.dart';
import 'package:sway/presentation/order/ui/order_screen.dart';

class OrderUi extends StatelessWidget {
  const OrderUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderBloc>(
      create: (context) => OrderBloc()..add(OrderInitialEvent()),
      child: const OrderScreen(),
    );
  }
}
