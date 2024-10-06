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

  // CopyWith method for HomeLoaded
  HomeLoaded copyWith({List<ProductModel>? products}) {
    return HomeLoaded(
      products: products ?? this.products, // Use the provided products or keep the existing
    );
  }

  @override
  List<Object> get props => [products];
}

final class SearchResult extends HomeState {
  final List<ProductModel> products;

  const SearchResult({required this.products});

  // CopyWith method for SearchResult
  SearchResult copyWith({List<ProductModel>? products}) {
    return SearchResult(
      products: products ?? this.products, // Use the provided products or keep the existing
    );
  }

  @override
  List<Object> get props => [products];
}

