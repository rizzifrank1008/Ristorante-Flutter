import '../datasources/menu_firebase_data_source.dart';

abstract class MenuRepository {
  Future<List<String>> getCategories();
}

class MenuRepositoryImpl implements MenuRepository {
  final MenuFirebaseDataSource dataSource;

  MenuRepositoryImpl(this.dataSource);

  @override
  Future<List<String>> getCategories() => dataSource.getCategories();
}
