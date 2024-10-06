import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sway/presentation/home/bloc/home_bloc.dart';
import 'package:sway/presentation/home/ui/home_screen.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(HomeInitialEvent()),
      child: const HomeScreen(),
    );
  }
}
