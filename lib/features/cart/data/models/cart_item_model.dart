import 'package:get/get.dart';

class CartItem {
  final String productId;
  final String title;
  final double price;
  var quantity = 1.obs;  // Usa RxInt per rendere la quantità osservabile

  CartItem({required this.productId, required this.title, required this.price, required int quantity}) {
    this.quantity.value = quantity;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 0) quantity.value--;
  }

  double get totalPrice => price * quantity.value;
}
