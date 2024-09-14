import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/add_to_wishlist_response_entity.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/get_wishlist_response_entity.dart';
import 'package:e_commerce/domain/repository/data_sources/wishlist_remote_datasource_contract.dart';
import 'package:e_commerce/domain/repository/repository/wishlist_repository_contract.dart';

class WishListRepositoryImpl implements WishListRepositoryContract {
  WishListRemoteDataSourceContract remoteDataSourceDelegate;

  WishListRepositoryImpl({required this.remoteDataSourceDelegate});

  @override
  Future<Either<Errors, GetWishListResponseEntity>> getWishList() {
    return remoteDataSourceDelegate.getWishList();
  }

  @override
  Future<Either<Errors, AddToWishListResponseEntity>> removeFromWishList(
      String productId) {
    return remoteDataSourceDelegate.removeFromWishList(productId);
  }
}
