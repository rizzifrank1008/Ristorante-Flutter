import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ristorante_finale/routes/routes.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // TextEditingControllers for registration form
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void onClose() {
    // Dispose controllers when the controller is removed from memory
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    addressController.dispose();
    countryController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    try {
      print("Attempting registration without logging in");
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Registration successful, user is automatically logged in, proceed to log them out.
      print("User registered, user UID: ${userCredential.user!.uid}");

      String uid = userCredential.user!.uid;
      await _auth.signOut();  // Ensure the user is logged out after registration

      // Create a new document in Firestore for the registered user
      await _firestore.collection('users').doc(uid).set({
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': emailController.text.trim(),
        'age': int.parse(ageController.text.trim()),
        'address': addressController.text.trim(),
        'country': countryController.text.trim(),
      });

      print("User data saved to Firestore, user logged out, navigating to AUTH page");

      // Navigate to AUTH route after successful registration and logout
      Get.offAllNamed(Routes.AUTH);
    } catch (e) {
      print("Failed to register: ${e}");
      Get.snackbar('Errore di Registrazione', 'Impossibile registrare l\'utente: ${e.toString()}');
    }
  }

  // Navigation to login page if the user chooses to login
  void navigateToLogin() {
    Get.offAllNamed(Routes.AUTH);
  }
}
