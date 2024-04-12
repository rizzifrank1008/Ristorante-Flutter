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

import '../data/datasources/product_firebase_data_source.dart';
import '../data/repositories_impl/product_repository_impl.dart';
import '../presentation/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ProductFirebaseDataSource>(() => ProductFirebaseDataSource());
    Get.lazyPut<ProductRestourantController>(() => ProductRestourantController(repository: Get.find()));
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(Get.find()));
  }
}
