// Get.lazyPut: Questa funzione registra una dipendenza in modo che venga creata solo quando è necessaria,
// non appena viene richiesta
// per la prima volta. Questo aiuta a ridurre il consumo di risorse iniziale.
// MenuFirebaseDataSource: Si registra il datasource che interagisce
// direttamente con Firebase Firestore.
// MenuRepository: Si registra l'implementazione del repository che gestisce l'astrazione dei
// dati. Usa Get.find() per risolvere le dipendenze necessarie (in questo caso, MenuFirebaseDataSource).
// MenuRestourantController: Infine, si registra il controller che utilizza il repository per
// gestire i dati. Il controller è il punto di collegamento tra l'UI e la logica di business/data.

import 'package:get/get.dart';
import '../presentation/controller/menu_controller.dart';
import '../data/repositories_impl/menu_repository_impl.dart';
import '../data/datasources/menu_firebase_data_source.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    print("Configurazione delle dipendenze di MenuPage"); // Debugging
    Get.lazyPut<MenuFirebaseDataSource>(() => MenuFirebaseDataSource());
    Get.lazyPut<MenuRepository>(() => MenuRepositoryImpl(Get.find()));
    Get.lazyPut<MenuRestourantController>(() => MenuRestourantController(repository: Get.find()));
  }
}
