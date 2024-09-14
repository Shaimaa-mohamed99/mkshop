import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/get_wishlist_response_entity.dart';
import 'package:e_commerce/domain/repository/repository/wishlist_repository_contract.dart';

class GetWishListUseCase {
  WishListRepositoryContract repositoryDelegate;

  GetWishListUseCase({required this.repositoryDelegate});

  Future<Either<Errors, GetWishListResponseEntity>> invoke() {
    return repositoryDelegate.getWishList();
  }
}
