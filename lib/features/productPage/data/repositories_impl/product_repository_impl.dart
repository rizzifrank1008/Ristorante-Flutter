// MenuRepositoryImpl: È l'implementazione dell'interfaccia.
// Questa classe sa come ottenere effettivamente i dati, in questo caso
// utilizzando MenuFirebaseDataSource.
// Ciò decoppia il fetching dei dati dalla logica di business.




import '../datasources/product_firebase_data_source.dart';
import '../models/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getCategories();
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductFirebaseDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> getCategories() => dataSource.getCategories();
}