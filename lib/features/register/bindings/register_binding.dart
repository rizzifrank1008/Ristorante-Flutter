import 'package:get/get.dart';
import '../../login/presentation/controller/auth_controller.dart';
import '../presentation/controller/register_controller.dart';


class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}