import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart'; // Importa il CartController

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>(); // Ottieni il CartController

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Il tuo Carrello', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              cartController.clearCart(); // Pulisce il carrello utilizzando il metodo del controller
            },
          )
        ],
      ),
      body: Obx(() => ListView.builder(
        itemCount: cartController.cartItems.length, // Aggiorna il conteggio in base agli elementi nel carrello
        itemBuilder: (context, index) {
          final item = cartController.cartItems[index];
          return Card(
            elevation: 0,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.fastfood), // Sostituire con l'icona corretta se necessario
              title: Text(item.title),
              subtitle: Text("€${item.price.toStringAsFixed(2)}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => cartController.decreaseQuantity(item), // Diminuisci la quantità
                  ),
                  Text(item.quantity.toString()), // Mostra la quantità
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () => cartController.increaseQuantity(item), // Aumenta la quantità
                  ),
                ],
              ),
            ),
          );
        },
      )),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text('Totale: €${cartController.total.value.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))), // Aggiorna il totale dinamicamente
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Colore di sfondo
                ),
                child: const Text('Ordina', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  cartController.checkout(); // Processa il checkout
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
