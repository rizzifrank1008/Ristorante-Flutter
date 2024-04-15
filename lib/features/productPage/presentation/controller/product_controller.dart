// RxList<String>: È una lista reattiva di GetX. Qualsiasi modifica a questa lista
// provocherà l'aggiornamento dell'UI associato.
// loadCategorie(): Carica le categorie dal repository quando il controller
// viene inizializzato. Le categorie caricate sono poi
// assegnate alla lista reattiva, causando l'aggiornamento dell'UI.

import 'package:get/get.dart';
import '../../../../routes/routes.dart';
import '../../data/models/product_model.dart';
import '../../data/repositories_impl/product_repository_impl.dart';


class ProductRestourantController extends GetxController {
  // Cambia il tipo di 'categorie' in RxList<Category> per gestire gli oggetti Category
  final RxList<Product> categories = RxList<Product>();

  final ProductRepository repository; // Variabile per il repository, già correttamente tipizzata se hai seguito i passaggi precedenti.

  ProductRestourantController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    loadCategories(); // Carica le categorie all'inizializzazione del controller.
  }

  void loadCategories() async {
    // Recupera i dati dal repository, che ora restituisce List<Category>.
    final categoryList = await repository.getCategories();
    categories.assignAll(categoryList); // Aggiorna la lista osservabile con i nuovi dati.
  }

  List<Product> getProductsByCategory(String categoryId) {
    // Filtra i prodotti in base all'ID della categoria
    return categories.where((product) => product.categories.contains(categoryId)).toList();
  }

  var selectedIndex = 0.obs;  // Use Rx<int> to observe changes

  void changeTabIndex(int index) {
    selectedIndex.value = index;  // Update the observable value
    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        Get.toNamed(Routes.PROFILE);
        break;
      case 2:
      // Navigate to another route or do nothing
        break;
      case 3:
      // Navigate to another route or do nothing
        break;
      default:
        break;
    }
  }


}
