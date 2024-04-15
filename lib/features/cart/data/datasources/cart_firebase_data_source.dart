import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/cart_model.dart';

class CartFirebaseDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createOrder(CartOrder order) async {
    await firestore.collection('orders').add(order.toJson());
  }
}
