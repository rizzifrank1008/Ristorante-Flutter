import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristorante_finale/features/menuPage/presentation/controller/menu_controller.dart';

import '../../../../routes/routes.dart';
import '../../../home/presentation/pages/home_page.dart';

class MenuPage extends GetView<MenuRestourantController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu del Ristorante'),
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    category.title,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent, // Makes FAB background transparent
        elevation: 0,
        onPressed: () {},
        child: CircleAvatar(
          radius: 30, // Adjust the size for visual appearance
          backgroundColor: Colors.orange,
          child: Icon(Icons.shopping_cart, size: 35, color: Colors.white), // Adjust the icon size as needed
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              iconSize: 30,
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              iconSize: 30,
              onPressed: () {},
            ),
            SizedBox(width: 48),  // Provide space for the floating button
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_horiz, color: Colors.white),
              iconSize: 30,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
