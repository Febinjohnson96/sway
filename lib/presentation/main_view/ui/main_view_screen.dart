import 'package:flutter/material.dart';
import 'package:sway/presentation/home/home_ui.dart';
import 'package:sway/presentation/widgets/sw_scaffold_without_padding.dart';
import 'package:sway/presentation/widgets/sway_navbar.dart';
import 'package:sway/util/app_logger.dart';

class MainViewScreen extends StatefulWidget {
  const MainViewScreen({super.key});

  @override
  State<MainViewScreen> createState() => _MainViewScreenState();
}

class _MainViewScreenState extends State<MainViewScreen> {
  int _pageIndex = 0;

  final List<Widget> _views = const [
    HomeUi(),
    Text("Home View"),
    Text("Profile View"),
    Text("Help View"),
    Text("Logout View"),
  ];
  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithoutPadding(
      bottomNavigationBar: SwayNavbar(
        onIconTapped: (p0) {
          setState(() {
            _pageIndex = p0;
          });
          AppLogger.debuglog(_pageIndex.toString());
        },
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _views[_pageIndex],
      ),
    );
  }
}
