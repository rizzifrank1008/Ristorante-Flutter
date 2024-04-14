// MenuRepositoryImpl: È l'implementazione dell'interfaccia.
// Questa classe sa come ottenere effettivamente i dati, in questo caso
// utilizzando MenuFirebaseDataSource.
// Ciò decoppia il fetching dei dati dalla logica di business.




import '../../../menuPage/data/datasources/menu_firebase_data_source.dart';
import '../../domain/repositories/product-details_repository.dart';
import '../datasources/product-details_firebase_data_source.dart';
import '../models/product-details_model.dart';

abstract class ProductDetailsRepository{
  Future<List<ProductDetails>> getCategories();
}

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsFirebaseDataSource dataSource;

  ProductDetailsRepositoryImpl(this.dataSource);

  @override
  Future<List<ProductDetails>> getCategories() => dataSource.getCategories();
}