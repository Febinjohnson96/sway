part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class CartInitialEvent extends CartEvent {}

final class CartAddEvent extends CartEvent {
  final ProductModel product;

  const CartAddEvent({required this.product});

  @override
  List<Object> get props => [product];
}

final class CartDeleteItemEvent extends CartEvent {
  final String productId;

  const CartDeleteItemEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}
