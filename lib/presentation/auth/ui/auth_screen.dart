import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sway/config/app_colors.dart';
import 'package:sway/config/app_typography.dart';
import 'package:sway/config/route_name.dart';
import 'package:sway/presentation/auth/bloc/auth_bloc.dart';
import 'package:sway/presentation/widgets/authentication_button.dart';
import 'package:sway/presentation/widgets/sw_scaffold_with_padding.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwScaffoldWithPadding(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthSuccess){
            context.go(RouteName.home);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get Started",
              style: AppTypography.sWaySemibold32,
            ),
            Text(
              "with your sway account",
              style: AppTypography.sWayMedium16
                  .copyWith(color: AppColors.primary500),
            ),
            SizedBox(height: 20.h),
            Align(
                alignment: Alignment.center,
                child: AuthenticationButton(
                  onTap: () => context.read<AuthBloc>()..add(AuthLoginEvent()),
                )),
            SizedBox(
              height: 12.h,
            ),
            Center(
              child: Text(
                "By signing up you agree to our Terms and Privacy Policy",
                style: AppTypography.sWayMedium12
                    .copyWith(color: AppColors.primary900),
              ),
            )
          ],
        ),
      ),
    );
  }
}
