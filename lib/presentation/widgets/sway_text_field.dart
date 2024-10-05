import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/gen/assets.gen.dart';

class SwayTextField extends StatelessWidget {
  const SwayTextField({
    super.key,
    required this.searchController,
    required this.hintText, this.onChanged,
  });
  final TextEditingController searchController;
  final String hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChanged?.call(value),
      controller: searchController,
      onTapOutside: (event) =>
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        prefixIcon: SizedBox(
                      height: 10.h,
            width: 10.w,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              Assets.vector.home.searchIcon,
              fit: BoxFit.cover,
            ),
          ),
        ),
        hintText: hintText,
        hintStyle:
            AppTypography.sWayRegular16.copyWith(color: AppColors.primary400),
        border:
            const OutlineInputBorder(), // This adds a border around the text field
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary400, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary400, width: 1.0),
        ),
      ),
    );
  }
}
