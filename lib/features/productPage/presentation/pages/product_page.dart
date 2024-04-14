import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/routes.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../productDetailsPage/presentation/pages/product-details_page.dart';
import '../controller/product_controller.dart';

class ProductPage extends GetView<ProductRestourantController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryId = Get.arguments; // Ottieni l'ID della categoria selezionata

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pasti del Ristorante'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, size: 24, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(), // Utilizza Navigator.pop per tornare alla schermata precedente
            );
          },
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Aggiungi Prodotto'),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[300]!, Colors.white54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Obx(() {
          final meals = controller.getProductsByCategory(categoryId);
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'image_${meal.id}',
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.network(
                          meal.imageUrl,
                          height: 180, // Reduced image height
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(meal.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.timer, size: 20),
                              const SizedBox(width: 4),
                              Text('Durata: ${meal.duration} min'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.star_rate, size: 20),
                              const SizedBox(width: 4),
                              Text('Complessità: ${meal.complexity}'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.euro_symbol, size: 20),
                              const SizedBox(width: 4),
                              Text('Prezzo: €${meal.price.toStringAsFixed(2)}'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              meal.isVegan
                                  ? const Icon(Icons.eco, size: 20, color: Colors.green) // Icona per i piatti vegani
                                  : const Icon(Icons.cancel, size: 20, color: Colors.red), // Icona per i piatti non vegani
                              const SizedBox(width: 4),
                              Text(meal.isVegan ? 'Piatto vegano' : 'Non vegano'), // Testo che cambia in base alla condizione
                            ],
                          ),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                          label: const Text(
                            'Aggiungi al carrello',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Logica per aggiungere al carrello
                          },
                        ),
                        SizedBox(width: 10), // Distanza tra i pulsanti
                        ElevatedButton.icon(
                          icon: const Icon(Icons.info_outline, color: Colors.white),
                          label: const Text(
                            'Dettagli',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.PRODOTTODETTAGLIO, arguments: meal.id);
                          },
                        ),
                      ],
                    ),

                  ],
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent, // Makes FAB background transparent
        elevation: 0,
        onPressed: () {},
        child: const CircleAvatar(
          radius: 30, // Adjust the size for visual appearance
          backgroundColor: Colors.orange,
          child: Icon(Icons.shopping_cart, size: 35, color: Colors.white), // Adjust the icon size as needed
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              iconSize: 30,
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              iconSize: 30,
              onPressed: () {},
            ),
            const SizedBox(width: 48),  // Provide space for the floating button
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.white),
              iconSize: 30,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
