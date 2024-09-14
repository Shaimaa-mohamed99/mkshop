import 'package:e_commerce/domain/entities/add_to_cart_response_entity.dart';
import 'package:e_commerce/domain/entities/add_to_wishlist_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/products_response_entity.dart';

abstract class ProductsTabStates {}

///* ------------- ProductTabStates -------------------

class ProductsTabInitialState extends ProductsTabStates {}

class ProductsTabLoadingState extends ProductsTabStates {}

class ProductsTabErrorState extends ProductsTabStates {
  Errors? error;

  ProductsTabErrorState({required this.error});
}

class ProductsTabSuccesslState extends ProductsTabStates {
  ProductsResponseEntity? productsResponse;

  ProductsTabSuccesslState({required this.productsResponse});
}

///* ------------- AddToCartStates -------------------

class AddToCartLoadingState extends ProductsTabStates {
  String? productId;

  AddToCartLoadingState({this.productId});
}

class AddToCartErrorState extends ProductsTabStates {
  Errors? error;
  String? productId;

  AddToCartErrorState({required this.error, this.productId});
}

class AddToCartSuccesslState extends ProductsTabStates {
  AddToCartResponseEntity? addToCartResponseEntity;
  String? productId;

  AddToCartSuccesslState(
      {required this.addToCartResponseEntity, this.productId});
}

///* ------------- AddToWishListStates -------------------
class AddToWishListLoadingState extends ProductsTabStates {
  String? productId;
  AddToWishListLoadingState(this.productId);
}

class AddToWishListErrorState extends ProductsTabStates {
  Errors? error;

  AddToWishListErrorState({required this.error});
}

class AddToWishListSuccesslState extends ProductsTabStates {
  AddToWishListResponseEntity? addToWishListResponseEntity;
  String? productId;

  AddToWishListSuccesslState(
      {required this.addToWishListResponseEntity, this.productId});
}
