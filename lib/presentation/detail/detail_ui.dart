import 'package:flutter/material.dart';
import 'package:sway/domain/model/product/product_model.dart';
import 'package:sway/presentation/detail/ui/detail_screen.dart';

class DetailUi extends StatelessWidget {
  const DetailUi({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return DetailScreen(
      product: product,
    );
  }
}
