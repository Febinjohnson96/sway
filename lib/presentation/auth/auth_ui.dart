import 'package:flutter/material.dart';
import 'package:sway/presentation/widgets/sw_scaffold_without_padding.dart';

class AuthUi extends StatelessWidget {
  const AuthUi({super.key});

  @override
  Widget build(BuildContext context) {
    return const SwScaffoldWithoutPadding(
      child: Center(
        child: Text("Auth"),
      ),
    );
  }
}
