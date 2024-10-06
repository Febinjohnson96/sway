import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        ],
      ),
    );
  }
}
