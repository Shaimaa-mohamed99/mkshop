import 'package:e_commerce/domain/dep_injections.dart';
import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/auth/register/register_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/home/home_screen.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_viewmodel.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';

final cartProductsCubit = ProductsTabViewModel(
    getAllProductsUseCase: injectGetAllProductsUseCase(),
    addToCartUseCase: injectAddToCartUseCase(),
    addToWishListUseCase: injectAddToWishListUseCase());

class MyRoutes {
  // static String? initialRoute = LoginScreen.routeName;
  static String? initialRoute = HomeScreen.routeName;

  static var myRoutes = {
    LoginScreen.routeName: (_) => const LoginScreen(),
    RegisterScreen.routeName: (_) => const RegisterScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    ProductDetailsScreen.routeName: (_) => const ProductDetailsScreen(),
    CartScreen.routeName: (_) => const CartScreen()
  };
}
