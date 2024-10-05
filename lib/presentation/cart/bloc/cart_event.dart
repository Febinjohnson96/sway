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
