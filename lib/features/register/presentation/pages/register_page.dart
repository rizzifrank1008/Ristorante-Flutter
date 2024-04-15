import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ristorante_finale/features/register/presentation/controller/register_controller.dart';

import '../../../../routes/routes.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Text(
                'Crea il tuo account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(
                controller: controller.firstNameController,
                icon: Icons.person,
                label: 'Nome',
                hint: 'Inserisci il tuo nome',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: controller.lastNameController,
                icon: Icons.person_outline,
                label: 'Cognome',
                hint: 'Inserisci il tuo cognome',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: controller.emailController,
                icon: Icons.email,
                label: 'Email',
                hint: 'Inserisci la tua email',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: controller.passwordController,
                icon: Icons.lock,
                label: 'Password',
                hint: 'Crea una password',
                isPassword: true,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: controller.ageController,
                icon: Icons.cake,
                label: 'Età',
                hint: 'Inserisci la tua età',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: controller.addressController,
                icon: Icons.home,
                label: 'Via',
                hint: 'Inserisci la tua via e numero civico',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: controller.countryController,
                icon: Icons.flag,
                label: 'Nazione',
                hint: 'Inserisci la tua nazione',
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: controller.register,
                child: const Text('Registrati', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // var email = controller.emailController.text;
                  // var password = controller.passwordController.text;
                  // controller.signUp(email, password);
                  Get.toNamed(Routes.AUTH);

                },
                child: const Text(
                  'Hai già un account? Accedi',
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

  Widget _buildTextField({
    required TextEditingController controller,
    IconData? icon,
    required String label,
    required String hint,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey.shade600),
      ),
    );
  }
}
