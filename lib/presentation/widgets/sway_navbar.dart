import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/gen/assets.gen.dart';

class SwayNavbar extends StatefulWidget {
  const SwayNavbar({super.key, this.onIconTapped});
  final Function(int)? onIconTapped;

  @override
  State<SwayNavbar> createState() => _SwayNavbarState();
}

class _SwayNavbarState extends State<SwayNavbar> {
  // Current index of the selected navbar item
  int _currentIndex = 0;

  // List of navbar icons
  final List<String> navbarIcons = [
    Assets.vector.home.homeIcon,
    Assets.vector.home.heartIcon,
    Assets.vector.home.cartIcon,
    Assets.vector.home.userIcon
  ];

  // List of corresponding labels for accessibility
  final List<String> navbarLabels = [
    'Home',
    'Favorites',
    'Cart',
    'Account',
  ];

  void _onIconTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity, // Use full width
      decoration: const BoxDecoration(
        color: AppColors.primary0,
        border: Border.symmetric(
            horizontal: BorderSide(color: AppColors.primary200, width: 1)),
      ),
      height: 86.h,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: navbarIcons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _onIconTapped(index);
              widget.onIconTapped?.call(index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  navbarIcons[index],
                  colorFilter: ColorFilter.mode(
                      _currentIndex == index
                          ? AppColors.primary900
                          : AppColors.primary400,
                      BlendMode.srcIn),
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(height: 4.h), // Space between icon and label
                Text(
                  navbarLabels[index],
                  style: AppTypography.sWayMedium12.copyWith(
                    color: _currentIndex == index
                        ? AppColors.primary900
                        : AppColors.primary400,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 65.w),
      ),
    );
  }
}
