import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristorante_finale/features/menuPage/presentation/controller/menu_controller.dart';

import '../../../../routes/routes.dart';
import '../../../cart/presentation/controller/cart_controller.dart';

class MenuPage extends GetView<MenuRestourantController> {
  const MenuPage({super.key});



  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Scaffold(

      appBar: AppBar(
        title: Text('Menù', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFD7D7D7),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Item'),
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
        child: Obx(() => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.PRODOTTO, arguments: category.id);
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(int.parse('0xFF${category.color}')).withOpacity(0.7),
                      Color(int.parse('0xFF${category.color}')),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    category.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Get.toNamed(Routes.CARRELLO);
        },
        child: Obx(() => Stack(
          alignment: Alignment.topRight,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFFF25C05),
              child: Icon(Icons.shopping_cart, size: 35, color: Colors.white),
            ),
            // Mostra il badge solo se ci sono elementi nel carrello
            if (cartController.cartItems.isNotEmpty)
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                    cartController.cartItems.length.toString(),
                    style: TextStyle(fontSize: 12, color: Colors.white)
                ),
              ),
          ],
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFD7D7D7),
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Obx(() => Icon(Icons.home,
                  color: controller.selectedIndex.value == 0
                      ? Color(0xFFF2510A)
                      : Colors.white)),
              iconSize: 30,
              onPressed: () => controller.changeTabIndex(0),
            ),
            IconButton(
              icon: Obx(() => Icon(Icons.person,
                  color: controller.selectedIndex.value == 1
                      ? Color(0xFFF2510A)
                      : Colors.white)),
              iconSize: 30,
              onPressed: () => controller.changeTabIndex(1),
            ),
            const SizedBox(width: 48), // Provide space for the floating button
            IconButton(
              icon: Obx(() => Icon(Icons.search,
                  color: controller.selectedIndex.value == 2
                      ? Color(0xFFF2510A)
                      : Colors.white)),
              iconSize: 30,
              onPressed: () => controller.changeTabIndex(2),
            ),
            IconButton(
              icon: Obx(() => Icon(Icons.more_horiz,
                  color: controller.selectedIndex.value == 3
                      ? Color(0xFFF2510A)
                      : Colors.white)),
              iconSize: 30,
              onPressed: () => controller.changeTabIndex(3),
            ),
          ],
        ),
      ),
    );
  }
}
