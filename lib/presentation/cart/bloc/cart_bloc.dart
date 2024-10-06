import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sway/domain/model/product/product_model.dart';
import 'package:sway/managers/payment/payment.dart';
import 'package:sway/util/app_logger.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final PaymentManager paymentManager;
  CartBloc({required this.paymentManager}) : super(CartInitial()) {
    on<CartInitialEvent>(_onCartInitialEvent);
    on<CartDeleteItemEvent>(_cartDeleteItem);
    on<OnTapPaymentEvent>(_paymentEvent);
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
        return ProductModel(
          id: doc.id,
          name: doc['name'],
          image: doc['image'],
          price: doc['price'],
        );
      }).toList();
      if (products.isNotEmpty) {
        AppLogger.infolog(products[0].id.toString());
        var total = 0;
        for (var product in products) {
          total += int.parse(product.price.toString());
        }
        emit(CartLoaded(products: products, totalPrice: total));
      } else {
        emit(CartEmpty());
      }
    } catch (e) {
      AppLogger.errorlog(e.toString());
      emit(CartError());
    }
  }

  void _cartDeleteItem(
      CartDeleteItemEvent event, Emitter<CartState> emit) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference reference = FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('items');
    try {
      await reference.doc(event.productId).delete();
      add(CartInitialEvent());
    } catch (e) {
      AppLogger.errorlog(e.toString());
      emit(CartError());
    }
  }

  void _paymentEvent(OnTapPaymentEvent event, Emitter<CartState> emit) async {
    paymentManager.enablePayment(amount: event.totalAmount);
    String userId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference orderRef = FirebaseFirestore.instance
        .collection('order')
        .doc(userId)
        .collection('items');
    CollectionReference cartRef = FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('items');

    try {
      QuerySnapshot cartSnapshot = await cartRef.get();

      for (QueryDocumentSnapshot doc in cartSnapshot.docs) {
        await orderRef.add(
            doc.data() as Map<String, dynamic>); // Cast to Map<String, dynamic>

        await doc.reference.delete();
      }
      emit(OrderSuccessState());
      add(CartInitialEvent());
    } catch (e) {
      AppLogger.errorlog(e.toString());
      emit(OrderFaliure());
    }
  }
}
