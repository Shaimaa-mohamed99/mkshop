import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/add_to_wishlist_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/repository/repository/products_tab_repository_contract.dart';

class AddToWishListUseCase {
  ProductsTabRepositoryContract repositoryDelegate;

  AddToWishListUseCase({required this.repositoryDelegate});

  Future<Either<Errors, AddToWishListResponseEntity>> invoke(
      String? productId) {
    return repositoryDelegate.addToWishList(productId);
  }
}
