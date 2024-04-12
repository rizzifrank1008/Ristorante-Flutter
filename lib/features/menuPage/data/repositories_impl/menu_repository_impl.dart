// MenuRepositoryImpl: È l'implementazione dell'interfaccia.
// Questa classe sa come ottenere effettivamente i dati, in questo caso
// utilizzando MenuFirebaseDataSource.
// Ciò decoppia il fetching dei dati dalla logica di business.

import '../datasources/menu_firebase_data_source.dart';
import '../models/category_model.dart';


abstract class MenuRepository {
  Future<List<Category>> getCategories();  // Modifica la firma per restituire una List<Category>
}

class MenuRepositoryImpl implements MenuRepository {
  final MenuFirebaseDataSource dataSource;

  MenuRepositoryImpl(this.dataSource);

  @override
  Future<List<Category>> getCategories() => dataSource.getCategories();  // La firma del metodo e il tipo di ritorno sono aggiornati
}