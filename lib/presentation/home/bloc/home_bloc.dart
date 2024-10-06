import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:sway/domain/model/product/product_model.dart';
import 'package:sway/util/app_logger.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_onHomeInitialEvent);
    on<SearchEvent>(_onSearchEvent);
  }
  void _onHomeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      List<ProductModel> products = snapshot.docs.map((doc) {
        return ProductModel(
          name: doc['name'],
          image: doc['image'],
          price: doc['price'],
        );
      }).toList();
      emit(HomeLoaded(products: products));
      AppLogger.infolog(products[0].name.toString());
    } catch (e) {
      AppLogger.errorlog(e.toString());
      emit(HomeError());
    }
  }

  void _onSearchEvent(SearchEvent event, Emitter<HomeState> emit) async {
      if (state is HomeLoaded) {
        final currentState = state as HomeLoaded;
        if (event.query.isNotEmpty) {
          final filteredProducts = currentState.products.where((product) {
            final nameLower = product.name?.toLowerCase() ?? '';
            final priceLower = product.price?.toLowerCase() ?? '';
            final discountLower = product.discount?.toLowerCase() ?? '';
            final searchLower = event.query.toLowerCase();

            return nameLower.contains(searchLower) ||
                priceLower.contains(searchLower) ||
                discountLower.contains(searchLower);
          }).toList();
          emit(HomeLoaded(products: filteredProducts));
        }else{
          emit(HomeLoaded(products: currentState.products));
        }
      }
  }
}
