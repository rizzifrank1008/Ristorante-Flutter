import '../entities/category_entity.dart';

abstract class MenuRepository {
  Future<List<CategoryEntity>> getCategories();
}
