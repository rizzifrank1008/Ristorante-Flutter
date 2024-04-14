// RxList<String>: È una lista reattiva di GetX. Qualsiasi modifica a questa lista
// provocherà l'aggiornamento dell'UI associato.
// loadCategorie(): Carica le categorie dal repository quando il controller
// viene inizializzato. Le categorie caricate sono poi
// assegnate alla lista reattiva, causando l'aggiornamento dell'UI.


import 'package:get/get.dart';
import '../../data/models/product-details_model.dart';
import '../../data/repositories_impl/product-details_repository_impl.dart';



class ProductDetailsRestourantController extends GetxController {
  // Cambia il tipo di 'categorie' in RxList<Category> per gestire gli oggetti Category
  final RxList<ProductDetails> categories = RxList<ProductDetails>();

  final ProductDetailsRepository repository; // Variabile per il repository, già correttamente tipizzata se hai seguito i passaggi precedenti.

  ProductDetailsRestourantController({required this.repository});

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

  List<ProductDetails> getProductsByCategory(String categoryId) {
    // Filtra i prodotti in base all'ID della categoria
    return categories.where((product) => product.categories.contains(categoryId)).toList();
  }


  ProductDetails? findProductById(String id) {
    final product = categories.firstWhereOrNull((product) => product.id == id);
    if (product == null) {
      print("Nessun prodotto trovato per l'ID: $id");
    } else {
      print("Prodotto trovato: ${product.title}");
    }
    return product;
  }





}
