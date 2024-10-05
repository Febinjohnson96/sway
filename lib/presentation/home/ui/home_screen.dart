import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/gen/assets.gen.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';
import 'package:sway/presentation/widgets/sway_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Discover",
                style: AppTypography.sWaySemibold32,
              ),
              const Spacer(),
              SvgPicture.asset(Assets.vector.home.bellIcon),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          SwayTextField(
            searchController: _searchController,
            hintText: "Search for clothes",
          ),
        ],
      ),
    );
  }
}
