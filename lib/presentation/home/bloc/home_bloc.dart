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
}
