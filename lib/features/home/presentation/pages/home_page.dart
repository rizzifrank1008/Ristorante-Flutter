import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristorante_finale/routes/routes.dart';
import '../../../login/presentation/controller/auth_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ottieni un'istanza di AuthController esempio  Dependency Injection
    final AuthController authController = Get.find<AuthController>();

    TextStyle descriptionStyle = TextStyle(
      fontSize: 18,
      color: Colors.white.withOpacity(0.9),
      fontFamily: 'Helvetica',
      height: 1.5,
    );

    ButtonStyle buttonStyle(Color backgroundColor) => ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Homepage',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        // Aggiungi qui il pulsante di logout
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.black, // Icona di logout color nero per coerenza
            onPressed: () {
              authController.logout(); // Chiama il metodo logout su AuthController
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sushi-Mania è il paradiso per gli amanti del sushi...',
                textAlign: TextAlign.center,
                style: descriptionStyle,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: buttonStyle(Colors.blue.shade400),
                      icon: const Icon(Icons.shopping_cart, color: Colors.white),
                      label: const Text('Carrello'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(Routes.MENU);
                      },
                      style: buttonStyle(Colors.green.shade400),
                      icon: const Icon(Icons.restaurant_menu, color: Colors.white),
                      label: const Text('Menu'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
