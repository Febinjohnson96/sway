import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sway/domain/model/product/product_model.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';
import 'package:sway/presentation/widgets/sway_appbar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: Column(
        children: [SwayAppbar(
          callback: () => context.pop(),
          title: "Details",
        )],
      ),
    );
  }
}

