import 'package:flutter/material.dart';
import 'package:sway/presentation/widgets/sw_scaffold_without_padding.dart';
import 'package:sway/presentation/widgets/sway_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SwScaffoldWithoutPadding(
      bottomNavigationBar: SwayNavbar(),
      child: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
