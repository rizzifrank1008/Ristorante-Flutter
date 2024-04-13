import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../controller/product_controller.dart';

class ProductPage extends GetView<ProductRestourantController> {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryId = Get.arguments; // Ottieni l'ID della categoria selezionata

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pasti del Ristorante'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, size: 40, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
                        borderRadius: BorderRadius.only(
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
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(meal.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.timer, size: 20),
                              SizedBox(width: 4),
                              Text('Durata: ${meal.duration} min'),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star_rate, size: 20),
                              SizedBox(width: 4),
                              Text('Complessità: ${meal.complexity}'),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.euro_symbol, size: 20),
                              SizedBox(width: 4),
                              Text('Prezzo: €${meal.price.toStringAsFixed(2)}'),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              meal.isVegan
                                  ? Icon(Icons.eco, size: 20, color: Colors.green) // Icona per i piatti vegani
                                  : Icon(Icons.cancel, size: 20, color: Colors.red), // Icona per i piatti non vegani
                              SizedBox(width: 4),
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
                          icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                          label: Text(
                            'Aggiungi al carrello',
                            style: TextStyle(color: Colors.white),  // Assicurati che il testo sia bianco
                          ),

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Add to cart logic
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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Get.to(() => HomePage());
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Navigation logic to cart
              },
            ),
          ],
        ),
      ),
    );
  }
}
