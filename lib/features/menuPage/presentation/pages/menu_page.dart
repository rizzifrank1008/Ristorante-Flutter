import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristorante_finale/features/menuPage/presentation/controller/menu_controller.dart';
// import 'FavoritesScreen.dart';
// import 'cart_screen.dart';

class MenuPage extends GetView<MenuRestourantController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu del Ristorante'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              size: 40,
              color: Colors.redAccent,
            ),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => FavoritesScreen(),
              // ));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 40,
              color: Colors.deepPurpleAccent,
            ),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => CartScreen(),
              // ));
            },
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                size: 40,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // UserAccountsDrawerHeader(
            //   accountName: Text("Nome Utente"),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
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
        padding: const EdgeInsets.all(10), // Aggiunge margini attorno al GridView
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
            childAspectRatio: 4 / 3,  // Modificato per ridurre la dimensione delle card
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return InkWell(
              onTap: () {
                // Define your navigation logic here
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                margin: const EdgeInsets.all(5), // Aggiunge margini attorno a ciascuna card
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
                      offset: Offset(0, 3), // changes position of shadow
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
    );
  }
}
