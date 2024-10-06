part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class SearchEvent extends HomeEvent {
  final String query;
  const SearchEvent({required this.query});

  @override
  List<Object> get props => [query];
}
