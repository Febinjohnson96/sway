part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

final class AddToCartEvent extends DetailEvent {
  final ProductModel product;
  const AddToCartEvent({required this.product});

  @override
  List<Object> get props => [product];
}
