import 'package:get/get.dart';
import '../presentation/controller/menu_controller.dart';
import '../data/repositories_impl/menu_repository_impl.dart';
import '../data/datasources/menu_firebase_data_source.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    print("Configurazione delle dipendenze di MenuPage"); // Debugging
    Get.lazyPut<MenuFirebaseDataSource>(() => MenuFirebaseDataSource());
    Get.lazyPut<MenuRepository>(() => MenuRepositoryImpl(Get.find()));
    Get.lazyPut<MenuRestourantController>(() => MenuRestourantController(repository: Get.find()));
  }
}
