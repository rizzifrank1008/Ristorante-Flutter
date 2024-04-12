import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart'; // Import necessario per manipolare le UI Overlays
import 'firebase_options.dart';
import 'routes/app_pages.dart';
import 'routes/routes.dart';
import 'data_uploader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // // Opzionale: Esegui il caricamento dei dati all'avvio
  // if (shouldUploadData()) {
  //   await uploadData();
  // }

  // Nascondi la barra di stato e la barra di navigazione all'avvio dell'app
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

// bool shouldUploadData() {
//   return true;  // Per semplicità, lo facciamo sempre qui
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo Ristorante',
      debugShowCheckedModeBanner: false, // Rimuove il banner di debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.AUTH,
      getPages: AppPages.routes,
    );
  }
}
