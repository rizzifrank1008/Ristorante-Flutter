import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristorante_finale/features/menuPage/presentation/controller/menu_controller.dart';

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
            colors: [Colors.white, Colors.grey[100]!, Colors.white54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Obx(() {
          final meals = controller.getProductsByCategory(categoryId); // Ottieni solo i prodotti della categoria selezionata
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return ListTile(
                title: Text(meal.title),
                subtitle: Text(meal.complexity),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(meal.imageUrl),
                ),
                onTap: () {
                  // Implementa l'azione da eseguire quando si seleziona un pasto
                },
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
                // Aggiungi qui la logica di navigazione al Carrello
              },
            ),
          ],
        ),
      ),
    );
  }
}
