import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristorante_finale/routes/routes.dart';
import '../../../login/presentation/controller/auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        title: Text('Homepage', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
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
            color: Colors.deepPurple[400], // Imposta qui il colore di sfondo viola
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
                SizedBox(height: 20),
                Text(
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
                    'Sushi-Mania è il paradiso per gli amanti del sushi...',
                    textAlign: TextAlign.center,
                    style: descriptionStyle,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ElevatedButton.icon(
                      style: buttonStyle(Color.fromRGBO(245, 110, 73, 1)), // Applica il colore arancione
                      icon: const Icon(Icons.restaurant_menu, color: Colors.white),
                      label: Text('Menu', style: TextStyle(fontSize: 16)),
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
