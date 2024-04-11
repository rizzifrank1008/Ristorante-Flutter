import 'package:get/get.dart';
import 'package:ristorante_finale/routes/routes.dart';

import '../features/home/bindings/home_binding.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/login/bindings/auth_binding.dart';
import '../features/login/presentation/pages/auth_page.dart';
import '../features/menuPage/bindings/menu_binding.dart';
import '../features/menuPage/presentation/pages/menu_page.dart';

class AppPages{
  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()
    ),
    GetPage( // Aggiungi questa nuova rotta
      name: Routes.MENU,
      page: () => MenuPage(),
        binding: MenuBinding()
    ),
    GetPage( // Aggiungi questa nuova rotta
        name: Routes.AUTH,
        page: () => const AuthPage(),
        binding: AuthBinding()
    ),
  ];
}