part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrderFetchLoadingState extends OrderState {}

final class OrderEmptyState extends OrderState {}

final class OrderFetchSuccessState extends OrderState {
  final List<ProductModel> products;
  const OrderFetchSuccessState({required this.products});

  @override
  List<Object> get props => [products];
}

final class OrderFaliureState extends OrderState {}
