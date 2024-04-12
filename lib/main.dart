// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'routes/app_pages.dart'; // Assicurati che il percorso sia corretto
import 'routes/routes.dart'; // Assicurati che il percorso sia corretto
import 'data_uploader.dart';  // Assicurati di includere il nuovo file qui

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Opzionale: Esegui il caricamento dei dati all'avvio
  if (shouldUploadData()) {
    await uploadData();
  }

  runApp(const MyApp());
}

bool shouldUploadData() {
  // Qui puoi inserire la logica per decidere se eseguire o meno l'upload
  return true;  // Per semplicità, lo facciamo sempre qui
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
      initialRoute: Routes.AUTH,
      getPages: AppPages.routes,
    );
  }
}
