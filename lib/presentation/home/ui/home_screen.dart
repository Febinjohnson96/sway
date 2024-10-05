import 'package:flutter/widgets.dart';
import 'package:sway/presentation/widgets/sw_scaffold_without_padding.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SwScaffoldWithoutPadding(
      child: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
