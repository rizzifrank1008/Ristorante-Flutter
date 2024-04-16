import 'package:get/get.dart';
import '../../register/presentation/controller/register_controller.dart';
import '../presentation/controller/auth_controller.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}