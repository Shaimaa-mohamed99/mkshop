import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/add_to_wishlist_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/get_wishlist_response_entity.dart';

abstract class WishListRepositoryContract {
  Future<Either<Errors, GetWishListResponseEntity>> getWishList();
  Future<Either<Errors, AddToWishListResponseEntity>> removeFromWishList(
      String productId);
}
