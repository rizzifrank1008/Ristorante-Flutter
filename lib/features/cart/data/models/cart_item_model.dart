class CartItem {
  String productId;
  String title;
  double price;
  int quantity;

  CartItem({required this.productId, required this.title,required this.price, required this.quantity});

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) quantity--;
  }

  double get totalPrice => quantity * price;
}
