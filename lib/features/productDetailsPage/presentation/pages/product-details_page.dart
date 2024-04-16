import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../../data/models/product-details_model.dart';
import '../controller/product-details_controller.dart';

class ProductDetailsPage extends GetView<ProductDetailsRestourantController> {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dettagli del Prodotto', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFD7D7D7),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Obx(() {
          final ProductDetails? meal = controller.findProductById(productId);
          return meal != null ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      meal.imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(meal.title, style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('Durata: ${meal.duration} min • Complessità: ${meal.complexity} • Prezzo: €${meal.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: meal.isVegan
                      ? Row(
                    children: [
                      Icon(Icons.eco, color: Colors.green, size: 24),
                      SizedBox(width: 8),
                      Text('Piatto vegano', style: TextStyle(fontSize: 16))
                    ],
                  )
                      : Row(
                    children: [
                      Icon(Icons.cancel, color: Colors.red, size: 24),
                      SizedBox(width: 8),
                      Text('Non vegano', style: TextStyle(fontSize: 16))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('Procedimento:', style: Theme.of(context).textTheme.headline6),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: meal.steps.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text('${index + 1}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      title: Text(meal.steps[index]),
                    );
                  },
                ),
              ],
            ),
          ) : Center(child: Text('Prodotto non trovato'));
        }),
      ),
    );
  }
}
