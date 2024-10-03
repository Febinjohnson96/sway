import 'package:flutter/material.dart';

class SwScaffoldWithoutPadding extends StatelessWidget {
  const SwScaffoldWithoutPadding(
      {super.key, required this.child, this.bottomNavigationBar});

  final Widget child;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
