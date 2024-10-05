import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sway/domain/model/product/product_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<AddToCartEvent>(_addToCart);
  }

  Future<void> _addToCart(
      AddToCartEvent event, Emitter<DetailState> emit) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    CollectionReference reference = FirebaseFirestore.instance
        .collection('cart')
        .doc(userId)
        .collection('items');
    try {
      await reference.add(event.product.toJson());
      emit(AddToCartSuccess());
    } catch (e) {
      emit(AddToCartError());
    }
    emit(DetailInitial());
  }
}
