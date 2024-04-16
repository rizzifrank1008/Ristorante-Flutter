import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristorante_finale/routes/routes.dart';
import '../../../login/presentation/controller/auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    TextStyle descriptionStyle = TextStyle(
      fontSize: 18,
      color: Colors.white.withOpacity(0.9),
      fontFamily: 'Helvetica',
      height: 1.5,
    );

    // Aggiornamento dello stile del pulsante per renderlo più grande
    ButtonStyle buttonStyle(Color backgroundColor) => ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Aumentato il padding per una migliore area tattile
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Homepage', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.black,
            onPressed: () {
              authController.logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Permette il scrolling se il contenuto è troppo grande
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF272d2f),
          ),
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height, // Altezza totale meno quella dell'AppBar
          child: Center( // Centra il contenuto
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
              children: [
                Image.asset(
                  'lib/images/cuoco.png',
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Benvenuto al Ristorante!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'cliccando su menu potrai scegliere i piatti che preferisci e inviarci direttamente l ordine in cucina',
                    textAlign: TextAlign.center,
                    style: descriptionStyle,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ElevatedButton.icon(
                      style: buttonStyle(const Color(0xFFF2510A)), // Applica il colore arancione
                      icon: const Icon(Icons.restaurant_menu, color: Colors.white),
                      label: const Text('vai al Menu', style: TextStyle(fontSize: 16)),
                      onPressed: () {
                        Get.toNamed(Routes.MENU);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
