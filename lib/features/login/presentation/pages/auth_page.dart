import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                'Benvenuto',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Email',
                  hintText: 'Inserisci la tua email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password',
                  hintText: 'Inserisci la tua password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // Colore del testo
                  backgroundColor: Color.fromRGBO(245,110,73,1), // Colore di sfondo del pulsante (Arancione)
                  minimumSize: Size(double.infinity, 50), // Dimensione del pulsante
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Angoli arrotondati del pulsante
                  ),
                  elevation: 8, // Elevazione del pulsante per l'ombra
                  shadowColor: Color.fromRGBO(255, 140, 0, 0.5), // Colore dell'ombra
                ),
                onPressed: controller.login,
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),


              TextButton(
                onPressed: () {
                  var email = controller.emailController.text;
                  var password = controller.passwordController.text;
                  controller.signUp(email, password);
                },
                child: Text(
                  'Non hai un account? Registrati',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
