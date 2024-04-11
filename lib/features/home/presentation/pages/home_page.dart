import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Definizione dello stile del testo per la descrizione
    TextStyle descriptionStyle = TextStyle(
      fontSize: 18,
      color: Colors.white.withOpacity(0.9), // Rende il testo leggermente traslucido per una migliore lettura
      fontFamily: 'Helvetica', // Cambiato in Helvetica per uno stile più "Apple"
      height: 1.5, // Spaziatura tra le linee
    );

    // Definizione dello stile dei pulsanti
    ButtonStyle buttonStyle(Color backgroundColor) => ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: backgroundColor, // Colore del testo
      padding: const EdgeInsets.symmetric(vertical: 15), // Padding verticale più generoso
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Angoli più arrotondati
      ),
      elevation: 10, // Elevazione per un effetto ombra più marcato
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Rimuove l'ombra dell'AppBar per un aspetto più pulito
        centerTitle: true, // Centra il titolo
        title: Text(
          'Homepage',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Testo nero per coerenza con lo stile chiaro
          ),
        ),
        backgroundColor: Colors.white, // Sfondo bianco per l'AppBar
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sushi-Mania è il paradiso per gli amanti del sushi. Con una vasta selezione di piatti preparati con pesce fresco e ingredienti di alta qualità, offre un\'esperienza culinaria unica. Atmosfera accogliente e servizio impeccabile lo rendono il luogo ideale per gustare autentici sapori giapponesi e soddisfare le tue voglie di sushi.',
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
                      onPressed: () {
                        // Azione per il pulsante "Carrello"
                      },
                      style: buttonStyle(Colors.blue.shade400), // Usa lo stile definito sopra
                      icon: const Icon(Icons.shopping_cart, color: Colors.white),
                      label: const Text('Carrello'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(Routes.MENU); // Navigazione
                      },
                      style: buttonStyle(Colors.green.shade400), // Colore verde per diversificare
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
