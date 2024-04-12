// MenuRepository: È un'interfaccia che definisce cosa un consumer
// (come un controller) può fare con i dati,
// senza specificare come questi dati sono ottenuti o manipolati.


import '../../data/models/category_model.dart';
import '../entities/category_entity.dart';

abstract class MenuRepository {
  Future<List<Category>> getCategories();
}
