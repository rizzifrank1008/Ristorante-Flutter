import 'package:get/get.dart';

import '../../data/repositories_impl/menu_repository_impl.dart';
// Importa anche le altre classi necessarie, come il tuo repository.

class MenuRestourantController extends GetxController {
  final RxList<String> categorie = RxList<String>(); // Assicurati che questo corrisponda al tipo di dati che stai recuperando.

  final MenuRepository repository; // Assumi di avere una variabile per il repository.

  MenuRestourantController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    loadCategorie(); // Carica le categorie all'inizializzazione del controller.
  }

  void loadCategorie() async {
    // Qui vai a prendere i dati dal tuo repository.
    final categorieList = await repository.getCategories(); // Assumi che questo metodo restituisca una List<String>.
    categorie.assignAll(categorieList); // Aggiorna la lista osservabile.
  }
}
