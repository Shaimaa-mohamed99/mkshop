import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/add_to_wishlist_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/repository/repository/wishlist_repository_contract.dart';

class RemoveFromWishListUseCase {
  WishListRepositoryContract repositoryDelegate;

  RemoveFromWishListUseCase({required this.repositoryDelegate});

  Future<Either<Errors, AddToWishListResponseEntity>> invoke(String productId) {
    return repositoryDelegate.removeFromWishList(productId);
  }
}
