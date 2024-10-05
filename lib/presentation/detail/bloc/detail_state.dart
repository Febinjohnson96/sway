part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();
  
  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

final class AddToCartSuccess extends DetailState {}

final class AddToCartError extends DetailState {}
