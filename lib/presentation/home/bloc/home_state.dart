part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}
final class HomeError extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<ProductModel> products;
  const HomeLoaded({required this.products});

  @override
  List<Object> get props => [products];
}
