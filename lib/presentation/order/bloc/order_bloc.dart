import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sway/domain/model/product/product_model.dart';
import 'package:sway/util/app_logger.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderInitialEvent>(_orderInitialEvent);
  }
  void _orderInitialEvent(
      OrderInitialEvent event, Emitter<OrderState> emit) async {
    AppLogger.infolog("OrderInitialEvent");
    String userId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference orderRef = FirebaseFirestore.instance
        .collection('order')
        .doc(userId)
        .collection('items');
    try {
      emit(OrderFetchLoadingState());
      QuerySnapshot snapshot = await orderRef.get();
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
        emit(OrderFetchSuccessState(
          products: products,
        ));
      } else {
        emit(OrderEmptyState());
      }
    } catch (e) {
      AppLogger.errorlog(e.toString());
      emit(OrderFaliureState());
    }
  }
}
