import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sway/domain/model/product/product_model.dart';
import 'package:sway/util/app_logger.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(_onCartInitialEvent);
  }

  void _onCartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference cartRef = FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('items');

    try {
      emit(CartLoading());
      QuerySnapshot snapshot = await cartRef.get();
      List<ProductModel> products = snapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      if (products.isNotEmpty) {
        var total = 0;
        for (var product in products) {
          total += int.parse(product.price.toString());
        }
        emit(CartLoaded(products: products,totalPrice: total));
      } else {
        emit(CartEmpty());
      }
    } catch (e) {
      AppLogger.errorlog(e.toString());
      emit(CartError());
    }
  }
}
