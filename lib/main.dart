import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart'; // Assicurati che il percorso sia corretto
import 'routes/routes.dart'; // Assicurati che il percorso sia corretto
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo Ristorante',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.AUTH, // Usa la rotta iniziale definita in Routes
      getPages: AppPages.routes, // Usa le tue rotte definite in AppPages
    );
  }
}
