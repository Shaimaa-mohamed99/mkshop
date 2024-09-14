import 'package:e_commerce/domain/entities/products_response_entity.dart';
import 'package:e_commerce/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/add_to_wishlist_usecase.dart';
import 'package:e_commerce/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerce/ui/screens/home/home_tabs/products_tab/cubit/products_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTabViewModel extends Cubit<ProductsTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  AddToWishListUseCase addToWishListUseCase;

  ProductsTabViewModel(
      {required this.getAllProductsUseCase,
      required this.addToCartUseCase,
      required this.addToWishListUseCase})
      : super(ProductsTabInitialState());

  List<ProductEntity> products = [];
  num numOfProductsInCart = 0;

  static ProductsTabViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductsTabLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold(
      (error) => emit(
        ProductsTabErrorState(error: error),
      ),
      (response) {
        products = response.data ?? [];
        emit(
          ProductsTabSuccesslState(productsResponse: response),
        );
      },
    );
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(productId: productId));
    var either = await addToCartUseCase.invoke(productId);
    either.fold(
      (error) => emit(
        AddToCartErrorState(error: error, productId: productId),
      ),
      (response) {
        numOfProductsInCart = response.numOfCartItems ?? 0;
        emit(AddToCartSuccesslState(
            addToCartResponseEntity: response, productId: productId));
      },
    );
  }

  void addToWishList(String productId) async {
    emit(AddToWishListLoadingState(productId));
    var either = await addToWishListUseCase.invoke(productId);
    either.fold(
        (error) => emit(
              AddToWishListErrorState(error: error),
            ), (response) {
      emit(AddToWishListSuccesslState(addToWishListResponseEntity: response));
    });
  }
}
