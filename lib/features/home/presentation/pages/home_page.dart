import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Homepage',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sushi_sfondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Sushi-Mania è il paradiso per gli amanti del sushi. Con una vasta selezione di piatti preparati con pesce fresco e ingredienti di alta qualità, offre un\'esperienza culinaria unica. Atmosfera accogliente e servizio impeccabile lo rendono il luogo ideale per gustare autentici sapori giapponesi e soddisfare le tue voglie di sushi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  height: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Azione per il pulsante "Carrello"
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20), backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ), // Colore di sfondo del bottone
                        shadowColor: Colors.blue.shade300, // Colore dell'ombra
                        elevation: 5, // Altezza dell'ombra
                      ),
                      icon: const Icon(Icons.shopping_cart, color: Colors.black,), // Icona del carrello
                      label: const Text(
                        'Carrello',
                        style: TextStyle(
                          color: Colors.white, // Colore del testo
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(Routes.MENU); // Usa GetX per navigare alla MenuPage
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20), backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ), // Colore di sfondo del bottone
                        shadowColor: Colors.orange.shade300, // Colore dell'ombra
                        elevation: 5, // Altezza dell'ombra
                      ),
                      icon: const Icon(Icons.restaurant_menu, color: Colors.black,), // Icona del menu
                      label: const Text(
                        'Menu',
                        style: TextStyle(
                          color: Colors.white, // Colore del testo
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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