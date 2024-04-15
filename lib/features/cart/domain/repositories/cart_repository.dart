// MenuRepository: È un'interfaccia che definisce cosa un consumer
// (come un controller) può fare con i dati,
// senza specificare come questi dati sono ottenuti o manipolati.

import '../../data/models/cart_model.dart';


abstract class CartRepository {
  Future<void> createOrder(CartOrder order);
}