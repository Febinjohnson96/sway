part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<ProductModel> products;
  final int totalPrice;
  const CartLoaded({required this.products, required this.totalPrice});

  @override
  List<Object> get props => [products, totalPrice];
}

final class CartEmpty extends CartState {}

final class CartError extends CartState {}
