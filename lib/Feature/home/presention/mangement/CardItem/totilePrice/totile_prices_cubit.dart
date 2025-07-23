import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'totile_prices_state.dart';

class TotilePricesCubit extends Cubit<TotilePricesState> {
  TotilePricesCubit() : super(TotilePricesInitial());

  Future<void> addToTotalPrice(String uid, double amountToAdd) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
        'total_Price': FieldValue.increment(amountToAdd),
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
        'total_items': FieldValue.increment(1),
      });
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      final data = doc.data();
      if (data != null && data['total_Price'] != null) {
        double total_price = data['total_Price'] as double;
        int total_items = data['total_items'] as int;
        emit(TotilePricesAdded(total_price: total_price,total_product: total_items));}

    } catch (e) {
      emit(TotilePricesFailure(error: e.toString()));
    }
  }
  Future<void> subtractFromTotalPrice(String uid, double amountToSubtract) async {
    try{
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'total_Price': FieldValue.increment(-amountToSubtract),
    });
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'total_items': FieldValue.increment(-1),
    });

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    final data = doc.data();
    if (data != null && data['total_Price'] != null) {
      double total_price = data['total_Price'] as double;
      int total_items = data['total_items'] as int;
      emit(TotilePricessubtract(total_price: total_price,total_product: total_items));}

    } catch (e) {
      emit(TotilePricesFailure(error: e.toString()));
    }
  }

}
