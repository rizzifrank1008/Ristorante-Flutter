import 'package:get/get.dart';
import '../../menuPage/data/datasources/menu_firebase_data_source.dart';
import '../../menuPage/data/repositories_impl/menu_repository_impl.dart';
import '../../menuPage/presentation/controller/menu_controller.dart';
import '../../productPage/data/datasources/product_firebase_data_source.dart';
import '../../productPage/data/repositories_impl/product_repository_impl.dart';
import '../../productPage/presentation/controller/product_controller.dart';
import '../data/datasources/product-details_firebase_data_source.dart';

import '../data/repositories_impl/product-details_repository_impl.dart';
import '../presentation/controller/product-details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductFirebaseDataSource>(() => ProductFirebaseDataSource());
    Get.lazyPut<ProductRestourantController>(() => ProductRestourantController(repository: Get.find()));
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(Get.find()));


    Get.lazyPut<ProductDetailsFirebaseDataSource>(() => ProductDetailsFirebaseDataSource());
    Get.lazyPut<ProductDetailsRestourantController>(() => ProductDetailsRestourantController(repository: Get.find()));
    Get.lazyPut<ProductDetailsRepository>(() => ProductDetailsRepositoryImpl(Get.find()));

    Get.lazyPut<MenuFirebaseDataSource>(() => MenuFirebaseDataSource());
    Get.lazyPut<MenuRepository>(() => MenuRepositoryImpl(Get.find()));
    Get.lazyPut<MenuRestourantController>(() => MenuRestourantController(repository: Get.find()));

  }
}
