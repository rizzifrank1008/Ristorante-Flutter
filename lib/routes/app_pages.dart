import 'package:get/get.dart';
import 'package:ristorante_finale/routes/routes.dart';

import '../features/cart/bindings/cart_binding.dart';
import '../features/cart/presentation/pages/cart_page.dart';
import '../features/home/bindings/home_binding.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/login/bindings/auth_binding.dart';
import '../features/login/presentation/pages/auth_page.dart';
import '../features/menuPage/bindings/menu_binding.dart';
import '../features/menuPage/presentation/pages/menu_page.dart';
import '../features/productDetailsPage/bindings/product-details_binding.dart';
import '../features/productDetailsPage/presentation/pages/product-details_page.dart';
import '../features/productPage/bindings/product_binding.dart';
import '../features/productPage/presentation/pages/product_page.dart';
import '../features/profilePage/bindings/profile_binding.dart';
import '../features/profilePage/presentation/pages/profile_page.dart';
import '../features/register/bindings/register_binding.dart';
import '../features/register/presentation/pages/register_page.dart';

class AppPages{
  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()
    ),
    GetPage( // Aggiungi questa nuova rotta
      name: Routes.MENU,
      page: () => const MenuPage(),
        binding: MenuBinding()
    ),
    GetPage( // Aggiungi questa nuova rotta
        name: Routes.PRODOTTO,
        page: () => const ProductPage(),
        binding: ProductBinding()
    ),
    GetPage( // Aggiungi questa nuova rotta
        name: Routes.AUTH,
        page: () => const AuthPage(),
        binding: AuthBinding()
    ),
    GetPage( // Aggiungi questa nuova rotta
        name: Routes.REGISTER,
        page: () => const RegisterPage(),
        binding: RegisterBinding()
    ),
    GetPage( // Aggiungi questa nuova rotta
        name: Routes.PRODOTTODETTAGLIO,
        page: () => const ProductDetailsPage(),
        binding: ProductDetailsBinding()
    ),
    GetPage( // Aggiungi questa nuova rotta
        name: Routes.CARRELLO,
        page: () => const CartPage(),
        binding: CartBinding()
    ),
    GetPage( // Aggiungi questa nuova rotta
        name: Routes.PROFILE,
        page: () => const ProfilePage(),
        binding: ProfileBinding()
    ),
  ];
}

