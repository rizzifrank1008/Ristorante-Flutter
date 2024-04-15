import 'package:get/get.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/cart_model.dart';
import '../../data/repositories_impl/cart_repository_impl.dart';
import '../../domain/repositories/cart_repository.dart';

class CartController extends GetxController {
  final CartRepository repository;
  final RxList<CartItem> cartItems = RxList<CartItem>();
  final RxDouble total = RxDouble(0.0);
  final String userId;

  CartController({required this.repository, required this.userId});

  // Aggiungi un prodotto al carrello
  void addProduct(String productId, String title, double price) {  // Aggiungi il parametro title
    var existingItem = cartItems.firstWhereOrNull((item) => item.productId == productId);
    if (existingItem != null) {
      existingItem.increaseQuantity();
    } else {
      cartItems.add(CartItem(productId: productId, title: title, price: price, quantity: 1,));
    }
    updateTotal();
  }

  void removeProduct(String productId) {
    var existingItem = cartItems.firstWhereOrNull((item) => item.productId == productId);
    if (existingItem != null && existingItem.quantity > 1) {
      existingItem.decreaseQuantity();
    } else {
      cartItems.removeWhere((item) => item.productId == productId);
    }
    updateTotal();
  }

  void increaseQuantity(CartItem item) {
    item.increaseQuantity();
    updateTotal();
  }

  void decreaseQuantity(CartItem item) {
    item.decreaseQuantity();
    updateTotal();
  }

  void updateTotal() {
    double newTotal = 0.0;
    for (var item in cartItems) {
      newTotal += item.totalPrice;
    }
    total.value = newTotal;
  }

  void clearCart() {
    cartItems.clear();
    total.value = 0.0;
    Get.snackbar('Carrello', 'Il carrello è stato svuotato.');
  }

  Future<void> checkout() async {
    if (cartItems.isNotEmpty) {
      List<String> productIds = cartItems.map((item) => item.productId).toList();
      double orderTotal = total.value;
      CartOrder order = CartOrder(productIds: productIds, total: orderTotal, userId: userId);
      await repository.createOrder(order);
      clearCart();
      Get.snackbar('Successo', 'Ordine effettuato con successo!');
    } else {
      Get.snackbar('Errore', 'Il carrello è vuoto!');
    }
  }
}
